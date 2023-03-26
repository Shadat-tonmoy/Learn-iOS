//
//  SwuftUITextField.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwuftUITextField: View {
    
    @State var textFieldValue : String = ""
    @State var lastNameValue : String = ""
    
    var body: some View {
        VStack(spacing : 30) {
            TextField("First Name", text: $textFieldValue)
                .padding()
                .background(.gray.opacity(0.3))
            .cornerRadius(10)
            
            TextField("Last Name", text: $lastNameValue)
                .padding()
                .background(.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button(action: {
                
            }, label: {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.purple)
                    )
                
            })
                
        }
        .padding()
    }
}

struct SwuftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwuftUITextField()
    }
}
