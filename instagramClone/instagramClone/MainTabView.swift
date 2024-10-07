//
//  MainTabView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI
import FirebaseAuth

struct MainTabView: View {
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            NewPostView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            VStack {
                Text("Reels")
                Button {
                    AuthManager.shared.signout()
                } label: {
                    Text("로그아웃")
                }

            }
            
                .tabItem {
                    Image(systemName: "popcorn")
                }
                .tag(3)
            // Text("Profile")
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(4)
        }
        .tint(Color.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
