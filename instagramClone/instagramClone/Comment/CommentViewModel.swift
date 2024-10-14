//
//  CommentViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/14.
//

import Foundation

class CommentViewModel: ObservableObject {
    var comments: [Comment] = []
    var postId: String
    var postUserId: String
    
    init(post: Post) {
        self.postId = post.id
        self.postUserId = post.userId
        Task {
            await loadComment()
        }
    }
    
    func uploadComment(commentText: String) async {
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        let comment = Comment(
            id: UUID().uuidString,
            commentText: commentText,
            postId: postId,
            postUserId: postUserId,
            commentUserId: userId,
            date: Date()
        )
        await CommentManager.uploadComment(comment: comment, postId: postId)
        await loadComment()
    }
    
    func loadComment() async {
        self.comments = await CommentManager.loadComment(postId: postId)
        
        for i in 0..<comments.count {
            let user = await AuthManager.shared.loadUserData(userId: comments[i].commentUserId)
            comments[i].commentUser = user
        }
    }
    
}
