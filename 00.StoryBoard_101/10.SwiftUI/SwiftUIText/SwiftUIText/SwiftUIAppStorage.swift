//
//  SwiftUIAppStorage.swift
//  SwiftUIText
//
//  Created by Tonmoy on 2/4/23.
//

import SwiftUI

struct SwiftUIAppStorage: View {
//    @State var name : String? = nil
    
    @AppStorage("name") var name : String?
    
    var body: some View {
        
        VStack{
            if let safeName = name {
                Text("Name is : \(safeName)")
            }
            
            Text("Press enter for name")
            
            Button("Enter", action: {
                name = "Hello World"
//                UserDefaults().set(name, forKey: "name")
                
            })
        }.onAppear{
//            name = UserDefaults().string(forKey: "name")
        }
        
        
    }
}

struct SwiftUIAppStorage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAppStorage()
    }
}
