//
//  Comment.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/14.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: String
    let commentText: String
    
    let postId: String
    let postUserId: String
    
    let commentUserId: String
    var commentUser: User?
    
    let date: Date 
}


extension Comment {
    static var DUMMY_COMMENT: Comment = Comment(
        id: UUID().uuidString,
        commentText: "test comment",
        postId: UUID().uuidString,
        postUserId: UUID().uuidString,
        commentUserId: UUID().uuidString,
        date: Date())
}
