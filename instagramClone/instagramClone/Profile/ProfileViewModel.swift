//
//  ProfileViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/17.
//

import SwiftUI
import FirebaseFirestore

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
    
    func updateUser() async {
        do {
            try await updateUserRemote()
            updateUserLocal()
        } catch {
            print("DEBUG: Faild to update user data with error \(error.localizedDescription)")
        }
    }
    
    func updateUserLocal() {
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
    
    func updateUserRemote() async throws {
        // 딕셔너리 초기화 방법 1 -> var editedData1 = [String: Any]()
        // 딕셔너리 초기화 방법 2
        var editedData: [String: Any] = [:]
        
        if name != "", name != user?.name {
            // user?.name = name
            editedData["name"] = name
        }
        if username.isEmpty == false, username != user?.username {
            //user?.username = username
            editedData["username"] = username
        }
        if !bie.isEmpty, bie != user?.bie {
            //user?.bie = bie
            editedData["bie"] = bie
        }
        
        if !editedData.isEmpty, let userId = user?.id {
            try await Firestore.firestore().collection("users").document(userId).updateData(editedData)
        }
    }
    
}

