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
                        
//                        if todo.isCompleted == true {
//                            //투두가 완료 되었을때
//                            Image(systemName: "circle.fill")
//                                .foregroundStyle(Color.pink)
//                                .onTapGesture {
//                                    todo.isCompleted.toggle()
//                                }
//
//                        } else {
//                            //투두가 완료되지 않았을때
//                            Image(systemName: "circle")
//                                .foregroundStyle(Color.pink)
//                                .onTapGesture {
//                                    todo.isCompleted.toggle()
//                                }
//                        }
                        
                        NavigationLink {
                            Text("다음 화면입니다.")
                        } label: {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: Color.gray)
                                .foregroundStyle(todo.isCompleted ? Color.gray : Color.primary)
                            // isCompleted == true: gray
                            // isCompleted == false: black
                            
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
