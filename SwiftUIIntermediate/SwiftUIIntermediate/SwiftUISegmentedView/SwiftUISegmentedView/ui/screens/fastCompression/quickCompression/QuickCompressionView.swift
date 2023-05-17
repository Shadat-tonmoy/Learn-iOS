//
//  QuickCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QuickCompressionView: View {
    var body: some View {
        VStack{
            
            QuickCompressionOptionView()
            
            FitToShareWithView()
            
            Spacer()
            
        }
    }
}

struct QuickCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QuickCompressionView()
    }
}
