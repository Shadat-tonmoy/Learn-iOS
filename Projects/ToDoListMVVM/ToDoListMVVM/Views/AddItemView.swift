//
//  AddItemView.swift
//  ToDoListMVVM
//
//  Created by Shadat Tonmoy on 4/24/23.
//

import SwiftUI

struct AddItemView: View {
    
    @State var inputValue : String = ""
    @State var showAlert = false
    @EnvironmentObject var viewModel : TodoListViewModel
    @Environment(\.presentationMode) var presentationMode
    
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
                
                Button(action: addItem, label: {
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
            .alert("Invalid Value", isPresented: $showAlert, actions: {
                
            }, message: {
                HStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Please enter a valid value to continue.")
                }
                
            })
    }
    
    func addItem(){
        if(inputValue.count >= 3){
            viewModel.addNewItem(text: inputValue)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
        
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemView()
        }
        
    }
}
