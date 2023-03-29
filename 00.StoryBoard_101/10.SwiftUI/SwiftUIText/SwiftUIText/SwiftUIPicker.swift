//
//  SwiftUIPicker.swift
//  SwiftUIText
//
//  Created by Tonmoy on 28/3/23.
//

import SwiftUI

struct SwiftUIPicker: View {
    @State var selection : String = "1"
    
    var body: some View {
        
        VStack{
            Text("Selected Item : \(selection)")
            
//            Picker(selection: $selection, label: Text("Picker"), content: {
//                Text("1").tag("1")
//                Text("2").tag("2")
//                Text("3").tag("3")
//            })
//            .pickerStyle(.menu)
            
            Picker(selection: $selection, content: {
                ForEach(18..<100, content: { index in
                    Text("\(index)")
                })
                
            }, label: {
                Text("Picker")
            }).pickerStyle(.wheel)
        }
        
       
    }
}

struct SwiftUIPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPicker()
    }
}
