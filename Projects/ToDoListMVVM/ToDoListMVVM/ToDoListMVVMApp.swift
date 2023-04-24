//
//  ToDoListMVVMApp.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

@main
struct ToDoListMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoListView()
            }
            
        }
    }
}
