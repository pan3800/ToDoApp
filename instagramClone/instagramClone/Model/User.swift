//
//  User.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/03.
//

import Foundation
import FirebaseAuth

struct User: Codable, Identifiable {
    let id: String
    let email: String
    var username: String
    var name: String
    var bie: String?
    var profileImageUrl: String?
    var isFollowing: Bool?
    
    var isCurrentUser: Bool {
        guard let currentUserId = AuthManager.shared.currentUser?.id else { return false }
        return id == currentUserId
    }
}

extension User {
    static var DUMMY_USER: User = User(
        id: UUID().uuidString,
        email: "dummy@gmail.com",
        username: "dummy",
        name: "dummy")
}
