//
//  SwiftUIOnAppear.swift
//  SwiftUIText
//
//  Created by Tonmoy on 30/3/23.
//

import SwiftUI

struct SwiftUIOnAppear: View {
    @State var myText = "This is a text"
    @State var count = 0
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text(myText)
                }
                
                LazyVStack{
                    ForEach(0..<50, content: { index in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear{
                                count += 1
                            }
                    })
                }
            }
            .navigationTitle("OnAppear : \(count)")
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                myText = "Text is updated at onAppear callback"
            })
            
        }
    }
}

struct SwiftUIOnAppear_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIOnAppear()
    }
}
