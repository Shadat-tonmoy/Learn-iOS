//
//  ContentView.swift
//  TouchDown
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing : 0) {
                
                CustomNavbar()
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack(spacing: 0){
                        
                        PlayerSliderView()
                        
                        CategoryGridView()
                        
                        ProductGridView()
                        
                        FooterView()
                            .padding(.horizontal)
                        
                        
                        
                    }
                    
                }
            }
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        }.ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}