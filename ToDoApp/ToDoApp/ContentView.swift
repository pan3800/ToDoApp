//
//  ContentView.swift
//  ToDoApp
//
//  Created by 임채성 on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
    
    var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "과제 제출하기"),
        Todo(title: "푹쉬기")
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(todoList) { todo in
                    HStack {
                        Image(systemName: "circle")
                            .foregroundStyle(Color.pink)
                        NavigationLink {
                            Text("다음 화면입니다.")
                        } label: {
                            Text(todo.title)
                        }
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
