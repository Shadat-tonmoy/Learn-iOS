//
//  ProductDetailsView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/22/23.
//

import SwiftUI

struct ProductDetailsView: View {
    let product : Product
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(product.getColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.leading, spacing: 0){
                
                ProductDetailsNavbar()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0){
                        Text(product.name)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ProductDetailsHeader(product: product)
                            .zIndex(5)
                        
                        VStack{
                            VStack{
                                ProductRatingSizeView()
                                
                                Text(product.description)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                .padding()
                                .padding(.top,2)
                                
                                ProductCountView()
                                    .padding(.top,16)
                                
                                AddToCartView(product: product)
                                    .padding()
                                
                                Spacer()
                            }
                            .padding(.top, 95)
                            .frame(height: 1560)
                        
                            
                        }
                        .background(.white)
                        .clipShape(TopRoundedCornerShape())
                        .padding(.top, -95)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.bottom)
                        .zIndex(1)
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
        }
        
        
        
        
        
        
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[0])
            
    }
}
