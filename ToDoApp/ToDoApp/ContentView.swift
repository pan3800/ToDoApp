//
//  ContentView.swift
//  ToDoApp
//
//  Created by 임채성 on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            List {
                HStack {
                    Image(systemName: "circle")
                        .foregroundStyle(Color.pink)
                    NavigationLink {
                        Text("다음 화면입니다.")
                    } label: {
                        Text("투두1")
                    }
                }
            }
            .navigationTitle("ToDo 🏓")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
