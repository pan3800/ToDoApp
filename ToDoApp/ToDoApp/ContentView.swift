//
//  ContentView.swift
//  ToDoApp
//
//  Created by 임채성 on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoList: [Todo] = [
        Todo(title: "친구 만나기"),
        Todo(title: "과제 제출하기"),
        Todo(title: "푹쉬기")
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(todoList) { todo in
                    HStack {
                        
                        Image(systemName: todo.isCompleted ? "circle.fill" : "circle")
                            .foregroundStyle(Color.pink)
                            .onTapGesture {
                                todo.isCompleted.toggle()
                            }
                        
                        NavigationLink {
                            Text("다음 화면입니다.")
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(todo.isCompleted ? Color.gray : Color.primary)
                            
                        }
                    }
                    .listRowSeparator(.hidden) // 각 행마다 hidden 적용
                }
            }
            .listStyle(.plain)
            .navigationTitle("ToDo 🏓")
            .toolbar {
                ToolbarItem() {
                    EditButton()
                }
                ToolbarItem() {
                    Button(action: {
                        print("플러스 버튼이 눌렸어요")
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
