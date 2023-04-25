//
//  TodoListView.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var viewModel : TodoListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.todoItems, id: \.self, content: { item in
                TodoListItem(todo: item)
                    .onTapGesture {
                        viewModel.toggleTodoCompletion(todo: item)
                    }
            })
            .onDelete(perform: viewModel.removeItem)
            .onMove(perform: viewModel.moveItem)
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
        }.environmentObject(TodoListViewModel())
        
    }
}
