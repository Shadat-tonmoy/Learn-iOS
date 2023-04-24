//
//  TodoListItem.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListItem: View {
    
    let todo : Todo
    
    
    var body: some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
            Text(todo.title)
            Spacer()
        }
        .padding(8)
    }
}

struct TodoListItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItem(todo: Todo(title: "Test todo"))
            .previewLayout(.sizeThatFits)
    }
}
