//
//  AuthManager.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/01.
//

import Foundation
import FirebaseAuth
import Firebase

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
            guard let userId = currentUserSession?.uid else { return }
            await uploadUserData(userId: userId, email: email, username: username, name: name)
        } catch {
            print("DEBUG: Faild to create user with error \(error.localizedDescription)")
        }
    }
    func uploadUserData(userId: String, email: String, username: String, name: String) async {
        let user = User(id: userId, email: email, username: username, name: name)
        do {
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Faild to upload user data with error \(error.localizedDescription)")
        }
    }
    
    func signin(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            currentUserSession = result.user
        } catch {
            print("DEBUG: Faild to log in with error \(error.localizedDescription)")
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


