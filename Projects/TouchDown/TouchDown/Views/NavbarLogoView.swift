//
//  NavbarLogoView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

struct NavbarLogoView: View {
    var body: some View {
        HStack(spacing: 4){
            Text("Touch".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
            
            Text("Down".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
        }
    }
}

struct NavbarLogoView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarLogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
