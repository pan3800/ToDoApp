//
//  User.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/03.
//

import Foundation
import FirebaseAuth

struct User: Codable {
    let id: String
    let email: String
    var username: String
    var name: String
    var bie: String?
    var profileImageUrl: String?
    
    //stored property -> 저장 프로퍼티
    //computed property -> 연산 프로퍼티
    var isCurrentUser: Bool {
        guard let currentUserId = AuthManager.shared.currentUser?.id else { return false }
//        if id == currentUserId {
//            return true
//        } else {
//            return false
//        }
        
        return id == currentUserId
    }
}
