//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Shadat Tonmoy on 4/15/23.
//

import SwiftUI

struct SettingsRowView: View {
    let name : String
    let content : String
    var linkLabel : String? = nil
    var linkDestination : String? = nil
    
    var body: some View {
        HStack{
            Text(name)
                .foregroundColor(.gray)
            Spacer()
          
            Text(content)
            if(linkLabel != nil && linkDestination != nil) {
                Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
            }
            else {
                EmptyView()
            }
        }
        .padding(.vertical,8)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Shadat Tonmoy")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
