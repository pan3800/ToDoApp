//
//  ContentView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var signupViewModel = SignupViewModel()
    @StateObject var authManager = AuthManager.shared
    
    var body: some View {
        if AuthManager.shared.currentUser == nil {
            LoginView()
                .environmentObject(signupViewModel)
        } else {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

