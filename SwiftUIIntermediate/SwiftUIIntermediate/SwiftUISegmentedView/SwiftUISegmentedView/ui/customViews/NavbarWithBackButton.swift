//
//  CustomNavbar.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/9/23.
//

import SwiftUI

struct NavbarWithBackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    let title : String
    
    var body: some View {
        ZStack {
            HStack{
                
                HStack {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        
                    
                    Text("Back")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .onTapGesture {
                            dismiss()
                        }
                        
                }
                Spacer()
                
            }
            .padding()
            .background(Color.toolbarBG)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            HStack{
                
                Spacer()
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}

struct NavbarWithBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavbarWithBackButton(title: "Fast Compression")
            .previewLayout(.sizeThatFits)
    }
}
