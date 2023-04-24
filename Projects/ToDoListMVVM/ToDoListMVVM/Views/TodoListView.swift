//
//  TodoListView.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListView: View {
    let todoItems : [String] = [
        "This is task 1",
        "This is task 2",
        "This is task 3",
        "This is task 4",
    ]
    var body: some View {
        List{
            ForEach(todoItems, id: \.self, content: { item in
                TodoListItem(title: item)
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
