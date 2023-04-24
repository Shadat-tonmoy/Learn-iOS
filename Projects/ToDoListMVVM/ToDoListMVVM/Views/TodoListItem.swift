//
//  TodoListItem.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct TodoListItem: View {
    
    let title : String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
        .padding(8)
    }
}

struct TodoListItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItem(title: "Task Title")
            .previewLayout(.sizeThatFits)
    }
}
