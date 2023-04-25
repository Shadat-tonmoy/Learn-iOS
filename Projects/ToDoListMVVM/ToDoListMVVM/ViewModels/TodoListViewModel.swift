//
//  TodoListViewModel.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/25/23.
//

import Foundation

class TodoListViewModel : ObservableObject{
    
    @Published var todoItems : [Todo] = []
    
    init() {
        getTodoItems()
    }
    
    func getTodoItems(){
        todoItems = [
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
    }
    
    func removeItem(indexSet : IndexSet){
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet : IndexSet, newIndex : Int){
        todoItems.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
    func addNewItem(text : String){
        let newItem = Todo(title: text)
        todoItems.append(newItem)
    }
    
    func toggleTodoCompletion(todo : Todo) {
        if var itemIndex = todoItems.firstIndex(where: { item in
            item.id == todo.id
        }) {
            todoItems[itemIndex] = todo.toggleCompleted()
        } else {
            print("Found item index is null")
        }
    }
    
    
}
