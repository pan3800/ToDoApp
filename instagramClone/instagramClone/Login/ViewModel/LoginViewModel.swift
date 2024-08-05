//
//  LoginViewModel.swift
//  instagramClone
//
//  Created by 임채성 on 2024/08/05.
//

import Foundation

class LoginViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signin() async{
        await AuthManager.shared.signin(email: email, password: password)
    }
}


