//
//  MainTabView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("NewPost")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Reels")
                .tabItem {
                    Image(systemName: "popcorn")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
