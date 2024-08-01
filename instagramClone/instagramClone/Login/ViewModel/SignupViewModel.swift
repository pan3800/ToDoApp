//
//  SignupViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/31.
//

import Foundation
import FirebaseAuth

class SignupViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var username = ""
    
//    @Published var currentUserSession: FirebaseAuth.User?
    
//    func createUser() async {
//        print("email:", email)
//        print("password:", password)
//        print("name:", name)
//        print("username:", username)
//
//        do {
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            currentUserSession = result.user
//        } catch {
//            print("DEBUG: Faild to create user with error \(error.localizedDescription)")
//        }
//    }
    
    func createUser() async {
        await AuthManager.shared.createUser(email: email, password: password, name: name, username: username)
        email = ""
        password = ""
        name = ""
        username = ""
    }
}
