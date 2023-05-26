//
//  SearchBarView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 5/26/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText : String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? .theme.secondaryText : .theme.accent)
            
            TextField("Search by name or symbol", text: $searchText)
                .autocorrectionDisabled(true)
                .overlay(alignment : .trailing){
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.theme.accent)
                        .padding()
                        .offset(x : 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    
                }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color : Color.theme.secondaryText.opacity(0.15),
                        radius: 25)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
//            .preferredColorScheme(.dark)
    }
}
