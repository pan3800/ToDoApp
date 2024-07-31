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
    
    func createUser() async {
        print("email:", email)
        print("password:", password)
        print("name:", name)
        print("username:", username)
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            let currentUser = result.user
            print("uid:", currentUser.uid)
        } catch {
            print("DEBUG: Faild to create user with error \(error.localizedDescription)")
        }
    }
}
