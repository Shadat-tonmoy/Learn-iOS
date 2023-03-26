//
//  SwiftUISheets.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUISheets: View {
    
    @State var showSheets : Bool = false
    
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                
                showSheets.toggle()
                
            }, label: {
                Text("Button")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.green)
                    .background(Color.white.cornerRadius(10))
                
                
            })
//            .fullScreenCover(isPresented: $showSheets, content: {
//                SheetView()
//            })
            .sheet(isPresented: $showSheets, content: {
                SheetView()
            })
        }
    }
}

struct SheetView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        
        ZStack (alignment: .top){
            
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading){
                
                Button(action: {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                    
                })
                
                Spacer()

                Text("Hello There From Sheet!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()

            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.orange)

            )
        }
        
    }
    
    
    
}

struct SwiftUISheets_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISheets()
    }
}
