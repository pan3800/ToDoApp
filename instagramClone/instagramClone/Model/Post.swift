//
//  Post.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/20.
//

import Foundation

// struct Post : Encodable, Decodable {
struct Post : Codable ,Identifiable{
    let id: String
    let userId: String
    let caption: String
    var like: Int
    let imageUrl: String
    let date: Date
    
    var isLike: Bool?
    
    var user: User?
}

extension Post {
    static var DUMMY_POST: Post = Post(
        id: UUID().uuidString,
        userId: UUID().uuidString,
        caption: "test caption",
        like: 125,
        imageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagramclone-5ef5f.appspot.com/o/images%2FB3F31025-7216-4E1A-8540-32D4A42D086B?alt=media&token=4178fa83-72e8-4560-a518-78e279dd86f5",
        date: Date()
    )
}
