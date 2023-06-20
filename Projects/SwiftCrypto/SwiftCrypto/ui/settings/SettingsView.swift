//
//  SettingsView.swift
//  SwiftCrypto
//
//  Created by Shadat Tonmoy on 6/20/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings : Bool
    
    private let youtubeUrl = URL(string: "https://www.youtube.com")!
    private let githubUrl = URL(string: "https://www.github.com")!
    private let coffeeUrl = URL(string: "https://www.buymecoffee.com")!
    private let apiUrl = URL(string: "https://www.coingecko.com")!
    private let linkedinUrl = URL(string: "https://www.linkedin.com")!
    
    var body: some View {
        VStack(alignment : .leading) {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Back")
            }
            .padding()
            .onTapGesture {
                showSettings.toggle()
            }
            List {
                appSectionView
                coinGekoSection
                developerSection
                
            }
            .accentColor(.blue)
            .font(.headline)
            .listStyle(GroupedListStyle())
        }
    }
}

extension SettingsView {
    private var appSectionView : some View {
        Section(content: {
            VStack(alignment : .leading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app is made with swift UI and swift following tutorial from Swiftful Thinking! using MVVM Architecture, Combine & CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Find the course on YouTube", destination: youtubeUrl)
            Link("Find source code at GitHub", destination: githubUrl)
            
            
        }, header: {
            Text("Crypto Tracer App")
        })
    }
    
    private var coinGekoSection : some View {
        Section(content: {
            VStack(alignment : .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("All the data of the app is used from CoinGecko Open Source API.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Get the insight of the Crypto API", destination: apiUrl)
            
        }, header: {
            Text("Coin Gecko API")
        })
    }
    
    private var developerSection : some View {
        Section(content: {
            VStack(alignment : .leading) {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom)
                
                Text("All the data of the app is used from CoinGecko Open Source API.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Find me on LinkedIn", destination: linkedinUrl)
            
        }, header: {
            Text("Developed by Shadat Tonmoy")
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettings: .constant(true))
    }
}
