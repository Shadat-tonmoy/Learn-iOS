//
//  SwiftUIPopOver2.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIPopOver2: View {
    @State var showSheet : Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Button(action: {
                    showSheet.toggle()
                    
                }, label: {
                    Text("Button")
                        .foregroundColor(.orange)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                })
                Spacer()
            }
            
            ZStack{
                if(showSheet){
                    SecondScreen2()
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
                
            }.zIndex(2.0)
        }
    }
}

struct SecondScreen2 : View{
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .edgesIgnoringSafeArea(.bottom)
        }.frame(height: UIScreen.main.bounds.height * 0.5)
    }
}

struct SwiftUIPopOver2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPopOver2()
    }
}
