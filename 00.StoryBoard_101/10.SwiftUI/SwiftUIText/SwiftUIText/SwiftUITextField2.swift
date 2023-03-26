//
//  SwiftUITextField2.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUITextField2: View {
    
    @State var textList : [String] = ["ABC","B","C","D","E"]
    @State var valueFromField = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack{
                    ForEach(textList.indices, id: \.self, content: {textIndex in
                        if(textIndex % 2 == 0){
                            HStack {
                                Text(textList[textIndex])
                                .foregroundColor(.white)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.purple)
                                )
                            }
                            .frame(maxWidth: .infinity , alignment: .trailing)
                            .padding()
                        } else {
                            HStack {
                                Text(textList[textIndex])
                                .foregroundColor(.white)
                                .padding(10)
                                .background(
                                RoundedRectangle(cornerRadius: 10)
                                        .fill(.blue)
                                )
                            }
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding()
                        }
                        
                    })
                }
            }
            
            Spacer()
            
            VStack(spacing : 20) {
                TextField("Enter Text Here", text: $valueFromField)
                    .padding()
                    .background(.gray.opacity(0.3))
                .cornerRadius(10)
                
                Button(action: {
                    textList.append(valueFromField)
                    valueFromField = ""
                    
                    
                }, label: {
                    Text("Submit")
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        
                }).buttonStyle(.borderedProminent)
                    .tint(.purple)
                    
            }.padding()
            
                
        }
    }
}

struct SwiftUITextField2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField2()
    }
}
