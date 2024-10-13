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
        let tempUser = AuthManager.shared.currentUser
        self.user = tempUser
        self.name = tempUser?.name ?? ""
        self.username = tempUser?.username ?? ""
        self.bie = tempUser?.bie ?? ""
    }
    
    init(user: User) {
        self.user = user
        self.name = user.name
        self.username = user.username
        self.bie = user.bie ?? ""
        
        checkFollow()
    }
    
    func convertImage(item: PhotosPickerItem?) async {
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
            guard let imageUrl = await ImageManager.uploadImage(uiImage: uiImage, path: .profile) else { return }
            editedData["profileImageUrl"] = imageUrl
        }
        
        if !editedData.isEmpty, let userId = user?.id {
            try await Firestore.firestore().collection("users").document(userId).updateData(editedData)
        }
        
        
    }
    
    func loadUserPosts() async {
        guard let userId = user?.id else { return }
        guard let posts =  await PostManager.loadUserPosts(userId: userId) else { return }
        self.posts = posts
//        do {
//            let documents = try await Firestore.firestore().collection("posts")
//                .order(by: "date", descending: true)
//                .whereField("userId", isEqualTo: user?.id ?? "").getDocuments().documents
//
//            var posts: [Post] = []
//            for document in documents {
//                let post = try document.data(as: Post.self)
//                posts.append(post)
//            }
//
//            self.posts = posts
//
//        } catch {
//            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
//        }
    }
}


extension ProfileViewModel {
    func follow() {
        Task {
            await AuthManager.shared.follow(userId: user?.id)
            user?.isFollowing = true
        }
    }
    
    func unfollow() {
        Task {
            await AuthManager.shared.unfollow(userId: user?.id)
            user?.isFollowing = false
        }
    }
    
    func checkFollow() {
        Task {
            self.user?.isFollowing =  await AuthManager.shared.checkFollow(userId: user?.id)
        }
    }
}
