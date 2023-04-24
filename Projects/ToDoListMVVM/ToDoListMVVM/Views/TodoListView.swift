//
//  TodoListView.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListView: View {
    let todoItems : [Todo] = [
        Todo(title: "This is todo 1"),
        Todo(title: "This is todo 2"),
        Todo(title: "This is todo 3"),
        Todo(title: "This is todo 4"),
        Todo(title: "This is todo 5"),
        Todo(title: "This is todo 6", isCompleted: true),
        Todo(title: "This is todo 7"),
        Todo(title: "This is todo 8", isCompleted: true),
        Todo(title: "This is todo 9"),
    ]
    var body: some View {
        List{
            ForEach(todoItems, id: \.self, content: { item in
                TodoListItem(todo: item)
            })
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddItemView(), label: {
            Text("Add")
        }))
        
        
        
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
        
    }
}
