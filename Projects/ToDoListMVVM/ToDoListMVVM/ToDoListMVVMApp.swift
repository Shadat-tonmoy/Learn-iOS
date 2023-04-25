//
//  ToDoListMVVMApp.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

@main
struct ToDoListMVVMApp: App {
    
    let todoListViewModel : TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoListView()
            }
            .environmentObject(todoListViewModel)
        }
    }
}
