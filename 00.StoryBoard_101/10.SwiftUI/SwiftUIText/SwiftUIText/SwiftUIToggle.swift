//
//  SwiftUIToggle.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIToggle: View {
    @State var isOn = false
    var body: some View {
        VStack(spacing : 20){
            HStack{
                Text("Status")
                Text(isOn ? "Online" : "Offline")
            }
            
            Toggle("Change Status", isOn: $isOn)
                .tint(.purple)
            
            Spacer()
        }.padding()
        
    }
}

struct SwiftUIToggle_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToggle()
    }
}
