//
//  TodoModel.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct Todo : Identifiable, Hashable, Codable {
    
    var id : String = UUID().uuidString
    let title : String
    var isCompleted : Bool = false
    
    
    init(id : String, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, isCompleted : Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompleted() -> Todo{
        return Todo(id : id, title: title, isCompleted: !isCompleted)
    }
}
