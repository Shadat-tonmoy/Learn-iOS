//
//  SwiftUIContextMenu.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIContextMenu: View {
    @State var backgroundColor : Color = Color.purple
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0){
            Image(systemName: "house.fill")
                .font(.largeTitle)
            Text("Shadat Tonmoy")
                .font(.title2)
            Text("How to use context menu")
                .font(.body)
        }
        .padding()
        .padding(.horizontal)
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(backgroundColor)
        )
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = Color.blue
            }, label: {
                Label("Share", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = Color.green
            }, label: {
                Label("Like", systemImage: "heart.fill")
            })
            
            Button(action: {
                backgroundColor = Color.purple                
            }, label: {
                Label("Report", systemImage: "info.circle.fill")
            })
        })
        
    }
}

struct SwiftUIContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIContextMenu()
    }
}
