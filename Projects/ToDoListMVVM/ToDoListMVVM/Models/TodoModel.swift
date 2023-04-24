//
//  TodoModel.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct Todo : Identifiable, Hashable {
    
    let id : String = UUID().uuidString
    let title : String
    var isCompleted : Bool = false
    
    mutating func toggleCompleted(){
        isCompleted = !isCompleted
    }
}
