//
//  Todo.swift
//  ToDoApp
//
//  Created by 임채성 on 2024/07/02.
//

import Foundation

class Todo: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var description: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.isCompleted = false
        self.description = ""
    }
}
