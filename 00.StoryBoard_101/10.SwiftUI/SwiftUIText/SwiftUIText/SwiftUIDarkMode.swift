//
//  SwiftUIDarkMode.swift
//  SwiftUIText
//
//  Created by Tonmoy on 30/3/23.
//

import SwiftUI

struct SwiftUIDarkMode: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Primary Color")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Secondary Color")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("White Color")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Black Color")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("No Color")
                        .font(.headline)
                    
                    Text("Adaptive Color")
                        .font(.headline)
                        .foregroundColor(colorScheme == .light ? .purple : .orange)
                    
                }
                
            }.navigationTitle("Dark Mode")
        }
    }
}

struct SwiftUIDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SwiftUIDarkMode()
                .preferredColorScheme(.dark)
            
            SwiftUIDarkMode()
                .preferredColorScheme(.light)
        }
    }
}
