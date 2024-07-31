//
//  ContentView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI

struct ContentView: View {
    @State var isLogin = false
    @StateObject var signupViewModel = SignupViewModel()
    
    var body: some View {
        if isLogin == true {
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
