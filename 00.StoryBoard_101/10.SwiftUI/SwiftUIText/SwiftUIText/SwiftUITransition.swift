//
//  SwiftUITransition.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUITransition: View {
    @State var showBottomSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            
                        
            VStack(){
                Button("Show", action: {
                    showBottomSheet.toggle()
                    
                })
                Spacer()
                if(showBottomSheet){
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
                
                    
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SwiftUITransition_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITransition()
    }
}
