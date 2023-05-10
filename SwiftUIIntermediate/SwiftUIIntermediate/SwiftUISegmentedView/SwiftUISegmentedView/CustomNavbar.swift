//
//  CustomNavbar.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/9/23.
//

import SwiftUI

struct CustomNavbar: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .font(.title)
                .foregroundColor(.black)
            
            Spacer()
            
            ZStack {
                Image(systemName: "cart")
                    .foregroundColor(.white)
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
        .background(.orange)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

struct CustomNavbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavbar()
            .previewLayout(.sizeThatFits)
    }
}
