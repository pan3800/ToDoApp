//
//  AuthManager.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/01.
//

import Foundation
import FirebaseAuth

class AuthManager : ObservableObject{
    
    static let shared = AuthManager()
    
    @Published var currentUserSession: FirebaseAuth.User?
    
    init() {
        currentUserSession = Auth.auth().currentUser
    }
    
    func createUser(email: String, password: String, name: String, username: String) async {
        print("email:", email)
        print("password:", password)
        print("name:", name)
        print("username:", username)
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            currentUserSession = result.user
        } catch {
            print("DEBUG: Faild to create user with error \(error.localizedDescription)")
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            currentUserSession = nil
        } catch {
            print("DEBUG: Faild to sign out with error \(error.localizedDescription)")
        }
    }
}
