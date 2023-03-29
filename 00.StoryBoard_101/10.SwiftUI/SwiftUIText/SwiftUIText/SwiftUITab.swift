//
//  SwiftUITab.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/30/23.
//

import SwiftUI

struct SwiftUITab: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab, content: {
            HomeView()
                .tabItem({
                    Image(systemName: "house.fill")
                    Text("Home")
                }).tag(0)
            
            OutputView()
                .tabItem({
                    Image(systemName: "folder.fill")
                    Text("Output")
                }).tag(1)
            
            MoreView()
                .tabItem({
                    Image(systemName: "ellipsis")
                    Text("More")
                }).tag(2)
            
        }).accentColor(getSelectedTabColor())
    
    }
    
    func getSelectedTabColor() -> Color{
        switch(selectedTab){
        case 0 : return Color.purple
        case 1 : return Color.orange
        case 2 : return Color.green
        default : return Color.purple
    
        }
        
    }
}

struct HomeView : View{
    
    var body: some View{
        ZStack{
            Color.purple
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                Text("Home")
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
    
}

struct OutputView : View{
    
    var body: some View{
        ZStack{
            Color.orange
                .edgesIgnoringSafeArea(.top)
            VStack{
                Text("Output")
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct MoreView : View{
    
    var body: some View{
        ZStack{
            Color
                .green
                .edgesIgnoringSafeArea(.top)
            VStack{
                Text("More")
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

struct SwiftUITab_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITab()
    }
}
