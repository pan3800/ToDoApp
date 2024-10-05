//
//  ProfileViewModel.swift
//  instagramClone
//
//  Created by agmma on 5/4/24.
//

import SwiftUI
import Firebase
import PhotosUI
import FirebaseStorage


class ProfileViewModel : ObservableObject {
    @Published var user: User?
    
    @Published var name: String
    @Published var username: String
    @Published var bie: String
    
    @Published var selectedItem: PhotosPickerItem?
    @Published var profileImage: Image?
    @Published var uiImage: UIImage?
    
    @Published var posts: [Post] = []
    
    init() {
        //        self.user = AuthManager.shared.currentUser
        let tempUser = AuthManager.shared.currentUser
        self.user = tempUser
        
        self.name = tempUser?.name ?? ""
        self.username = tempUser?.username ?? ""
        self.bie = tempUser?.bie ?? ""
    }
    
    func convertImage(item: PhotosPickerItem?) async {
        //        guard let item = item else { return }
        //        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        //        guard let uiImage = UIImage(data: data) else { return }
        //        self.profileImage = Image(uiImage: uiImage)
        //        self.uiImage = uiImage
        guard let imageSelection = await ImageManager.convertImage(item: item) else { return }
        self.profileImage = imageSelection.image
        self.uiImage = imageSelection.uiImage
    }
    
    func updateUser() async {
        do {
            try await updateUserRemote()
            updateUserLocal()
        } catch {
            print("DEBUG: Failed to update user data with error \(error.localizedDescription)")
        }
    }
    
    func updateUserLocal() {
        if name != "", name != user?.name {
            user?.name = name
        }
        if username.isEmpty == false, username != user?.username {
            user?.username = username
        }
        if !bie.isEmpty, bie != user?.bie {
            user?.bie = bie
        }
    }
    
    func updateUserRemote() async throws {
        var editedData: [String: Any] = [:]
        
        if name != "", name != user?.name {
            editedData["name"] = name
        }
        if username.isEmpty == false, username != user?.username {
            editedData["username"] = username
        }
        if !bie.isEmpty, bie != user?.bie {
            editedData["bie"] = bie
        }
        if let uiImage = self.uiImage {
            // guard let imageUrl = await ImageManager.uploadImage(uiImage: uiImage, path: "profiles") else { return }
            guard let imageUrl = await ImageManager.uploadImage(uiImage: uiImage, path: .profile) else { return }
            editedData["profileImageUrl"] = imageUrl
        }
        
        if !editedData.isEmpty, let userId = user?.id {
            try await Firestore.firestore().collection("users").document(userId).updateData(editedData)
        }
        
        
    }
    
    //    func uploadImage(uiImage: UIImage) async -> String? {
    //        guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else { return nil }
    //        let fileName = UUID().uuidString
    //        print("fileName:", fileName)
    //        let reference = Storage.storage().reference(withPath: "/profile/\(fileName)")
    //
    //        do {
    //            let metaData = try await reference.putDataAsync(imageData)
    //            print("metaData:", metaData)
    //            let url = try await reference.downloadURL()
    //            return url.absoluteString
    //        } catch {
    //            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
    //            return nil
    //        }
    //    }
    
    func loadUserPosts() async {
        do {
            let documents = try await Firestore.firestore().collection("posts")
                .order(by: "date", descending: true)
                .whereField("userId", isEqualTo: user?.id ?? "").getDocuments().documents
            
            var posts: [Post] = []
            for document in documents {
                let post = try document.data(as: Post.self)
                posts.append(post)
            }
            
            self.posts = posts
            
        } catch {
            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
        }
    }
}
