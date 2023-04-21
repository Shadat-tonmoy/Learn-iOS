//
//  CustomNavbar.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

struct CustomNavbar: View {
    
    @State var isAnimated = false
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .font(.title)
                .foregroundColor(.black)
            
            Spacer()
            
            NavbarLogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x : 0, y : isAnimated ? 0 : -25)
                .onAppear{
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                }
            
            Spacer()
            
            ZStack {
                Image(systemName: "cart")
                    .font(.title)
                .foregroundColor(.black)
                
                Circle()
                    .fill(.red)
                    .frame(width: 14,height: 14,alignment: .center)
                    .offset(x : 13, y : -10)
            }
            
        }
        .padding(.horizontal,15)
        .padding(.bottom)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

struct CustomNavbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavbar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
