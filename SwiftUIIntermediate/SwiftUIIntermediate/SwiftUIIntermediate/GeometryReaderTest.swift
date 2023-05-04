//
//  GeometryReaderTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct GeometryReaderTest: View {
    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing:0){
                Rectangle()
                    .fill(.red)
                    .frame(width : geometry.size.width * 0.6666)
                
                Rectangle()
                    .fill(.blue)
            }
            .ignoresSafeArea()
            
        }
        
    }
}

struct GeometryReaderTest_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderTest()
    }
}
