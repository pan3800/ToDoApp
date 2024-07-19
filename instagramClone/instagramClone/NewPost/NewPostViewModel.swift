//
//  NewPostViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/19.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

class NewPostViewModel : ObservableObject {
    @Published var caption = ""
    @Published var selectedItem: PhotosPickerItem?
    @Published var postImage: Image?
    @Published var uiImage: UIImage?
    
    func convertImage(item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    func uploadPost() async {
       
        guard let uiImage else { return }
        let url = await uploadImage(uiImage: uiImage)
        print("url:", url)
    }
    
    func uploadImage(uiImage: UIImage) async -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        print("fileName:", fileName)
        let reference = Storage.storage().reference(withPath: "/images/\(fileName)")
        
        do {
            let metaData = try await reference.putDataAsync(imageData)
            print("metaData:", metaData)
            let url = try await reference.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
        
        return nil
    }
}
