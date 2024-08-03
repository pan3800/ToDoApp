//
//  ContentView.swift
//  LifeCycle
//
//  Created by 임채성 on 2024/08/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Content View")
                    .onAppear {
                        print("[Content] onAppear")
                    }
                    .onDisappear {
                        print("[Content] onDisappear")
                    }
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Go To DetailView")
                }
            }
        }
        .onAppear {
            print("[NavigationView] onAppear")
        }
        .onDisappear {
            print("[NavigationView] onDisappear")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
