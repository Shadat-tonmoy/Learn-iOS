//
//  CircularButtonAnimationView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/22/23.
//

import SwiftUI

struct CircularButtonAnimationView: View {
    
    @Binding var animate : Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeInOut(duration: 1.0) : .none)
            
    }
}

struct CircularButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircularButtonAnimationView(animate: .constant(false))
    }
}
