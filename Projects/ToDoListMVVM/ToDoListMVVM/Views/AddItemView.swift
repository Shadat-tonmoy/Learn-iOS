//
//  AddItemView.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct AddItemView: View {
    
    @State var inputValue : String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something Here", text: $inputValue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray.opacity(0.25))
                    
                    )
                    .padding()
                
                Button(action: {
                    
                }, label: {
                    Text("Add Item".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(content: {
                            RoundedRectangle(cornerRadius: 12)
                            
                        })
                        .padding(.horizontal)
                })
                    
                
            }
        }.navigationTitle("Add Item 🖊")
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemView()
        }
        
    }
}
