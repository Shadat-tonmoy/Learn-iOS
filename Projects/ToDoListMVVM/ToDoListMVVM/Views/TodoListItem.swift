//
//  TodoListItem.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListItem: View {
    
    var todo : Todo
    
    
    var body: some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
                .font(.title3)
                .fontWeight(.semibold)
            Text(todo.title)
                .font(.title3)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct TodoListItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItem(todo: Todo(title: "Test todo"))
            .previewLayout(.sizeThatFits)
    }
}
