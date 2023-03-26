//
//  SwiftUITextEditor.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUITextEditor: View {
    @State var textEditorValue = "Type Here"
    
    var body: some View {
        NavigationView(content: {
            VStack{
                
                TextEditor(text: $textEditorValue)
                
                Button(action: {
                    
                },
                    label: {
                    Text("Submit")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                    
                    }
                )
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .padding()
                    
                
                }
            .padding()
            .navigationTitle("Text Editor Demo")
        }
    )
        
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}
