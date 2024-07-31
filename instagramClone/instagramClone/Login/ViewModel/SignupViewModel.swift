//
//  SignupViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/31.
//

import Foundation

class SignupViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var username = ""
    
    func createUser() {
        print("email:", email)
        print("password:", password)
        print("name:", name)
        print("username:", username)
    }
}
