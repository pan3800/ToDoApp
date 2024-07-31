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
    
    var body: some View {
        if Auth.auth().currentUser != nil {
            MainTabView()
        } else {
            LoginView()
                .environmentObject(signupViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
