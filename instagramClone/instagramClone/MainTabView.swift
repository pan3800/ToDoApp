//
//  MainTabView.swift
//  instagramClone
//
//  Created by 임채성 on 2024/07/10.
//

import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            Text("Feed")
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
            Text("Reels")
                .tabItem {
                    Image(systemName: "popcorn")
                }
                .tag(3)
            Text("Profile")
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
