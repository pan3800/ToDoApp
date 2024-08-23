//
//  ProfileViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/17.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    
    @Published var name: String
    @Published var username: String
    @Published var bie: String
    
    init() {
        // self.user = AuthManager.shared.currentUser
        let tempUser = AuthManager.shared.currentUser
        self.user = tempUser
        
        self.name = tempUser?.name ?? ""
        self.username = tempUser?.username ?? ""
        self.bie = tempUser?.bie ?? ""
    }
    
    func updateUser() {
        // and && ,
        // or ||
        if name != "", name != user?.name {
            user?.name = name
        }
        if username.isEmpty == false, username != user?.username {
            user?.username = username
        }
        if !bie.isEmpty, bie != user?.bie {
            user?.bie = bie
        }
    }
    
    
}
