//
//  ProductDetailsNavbar.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/22/23.
//

import SwiftUI

struct ProductDetailsNavbar: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.white)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Image(systemName: "cart")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
        }
        
    }
}

struct ProductDetailsNavbar_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsNavbar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
