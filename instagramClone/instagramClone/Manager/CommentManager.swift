//
//  CommentManager.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/14.
//

import Foundation
import Firebase

class CommentManager {
    static func uploadComment(comment: Comment, postId: String) async {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        do {
            try await Firestore.firestore()
                .collection("posts")
                .document(postId)
                .collection("post-comment")
                .addDocument(data: commentData)
        } catch {
            print("DEBUG: Faild to upload comment with error \(error.localizedDescription)")
        }
    }
    
    static func loadComment(postId: String) async -> [Comment] {
        do {
            let documents = try await Firestore.firestore()
                .collection("posts")
                .document(postId)
                .collection("post-comment")
                .order(by: "date", descending: true)
                .getDocuments()
                .documents
            
            let comments = documents.compactMap { document in
                try? document.data(as: Comment.self)
            }
            return comments
        } catch {
            print("DEBUG: Faild to load comment with error \(error.localizedDescription)")
            return []
        }
    }
}
