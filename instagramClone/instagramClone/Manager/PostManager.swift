//
//  PostManager.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/13.
//

import Foundation
import FirebaseFirestore

class PostManager {
    static func loadAllPosts() async -> [Post]? {
        do {
            let documents = try await Firestore.firestore().collection("posts").order(by: "date", descending: true)
                .getDocuments().documents
   
   
            let posts = try documents.compactMap({ document in
                print("posts:", document)
                return try document.data(as: Post.self)
            })
            return posts
        } catch {
            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
            return nil
        }
    }
    
    static func loadUserPosts(userId: String) async -> [Post]? {
        do {
            let documents = try await Firestore.firestore().collection("posts")
                .order(by: "date", descending: true)
                .whereField("userId", isEqualTo: userId).getDocuments().documents
            
            var posts: [Post] = []
            for document in documents {
                let post = try document.data(as: Post.self)
                posts.append(post)
            }
            
            return posts
            
        } catch {
            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
            return nil
        }
    }
}
