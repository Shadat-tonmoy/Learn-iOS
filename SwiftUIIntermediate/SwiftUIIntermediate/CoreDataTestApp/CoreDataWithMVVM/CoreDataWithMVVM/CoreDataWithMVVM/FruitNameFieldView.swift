//
//  FruitNameFieldView.swift
//  CoreDataWithMVVM
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI

struct FruitNameFieldView: View {
    
    @Binding var fruitNameFieldValue : String
    @Binding var selectedFruit : Fruit?
    var buttonClickListener : (_ action : Int) -> Void
    
    var body: some View {
        
        VStack{
            TextField("Enter Fruit Name Here", text: $fruitNameFieldValue)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.gray.opacity(0.2))
                )
                .padding(.horizontal)
            
            Button(selectedFruit != nil ? "Update Fruit" : "Add Fruits", action: {
                buttonClickListener(1)
                
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                
            )
            .foregroundColor(.white)
            .padding(.horizontal)
            
            Button("Cancel", action: {
                buttonClickListener(2)
            })
            .padding()
            
        }
        
    }
}
