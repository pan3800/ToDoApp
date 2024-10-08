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
    
    var user: User?
}
