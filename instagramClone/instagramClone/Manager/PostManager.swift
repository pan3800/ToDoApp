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

extension PostManager {
    static func like(post: Post) async {
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        let postsCollection = Firestore.firestore().collection("posts")
        let usersCollection = Firestore.firestore().collection("users")
        
        async let _ = usersCollection.document(userId).collection("user-like").document(post.id).setData([:])
        async let _ = postsCollection.document(post.id).collection("post-like").document(userId).setData([:])
        async let _ = postsCollection.document(post.id).updateData(["like": post.like + 1])
        
    }
    
    static func unlike(post: Post) async {
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        let postsCollection = Firestore.firestore().collection("posts")
        let usersCollection = Firestore.firestore().collection("users")
        
        async let _ = usersCollection.document(userId).collection("user-like").document(post.id).delete()
        async let _ = postsCollection.document(post.id).collection("post-like").document(userId).delete()
        async let _ = postsCollection.document(post.id).updateData(["like": post.like - 1])
    }
    
    static func checkLike(post: Post) async -> Bool {
        guard let userId = AuthManager.shared.currentUser?.id else { return false }
        do {
            let isLike = try await Firestore.firestore()
                .collection("users")
                .document(userId)
                .collection("user-like")
                .document(post.id)
                .getDocument()
                .exists
            return isLike
            
        } catch {
            print("DEBUG: Failed to check like with error \(error.localizedDescription)")
            return false
        }
    }
}
