//
//  SwiftUIPopOver.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIPopOver: View {
    
    @State var showSheet : Bool = false
    
    var body: some View {
        ZStack{
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Button(action: {
                    showSheet.toggle()
                    
                }, label: {
                    Text("Button")
                        .padding()
                        .foregroundColor(.orange)
                        .font(.title)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                })
                
                Spacer()
            }
            .sheet(isPresented: $showSheet, content: {
                SecondScreen()
            })
        }
    }
}


struct SecondScreen : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        ZStack(alignment: .topLeading){
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            
            }, label: {
                Image(systemName: "xmark")
                    .padding()
                    .foregroundColor(.white)
            })
        }
    }
}

struct SwiftUIPopOver_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPopOver()
    }
}
