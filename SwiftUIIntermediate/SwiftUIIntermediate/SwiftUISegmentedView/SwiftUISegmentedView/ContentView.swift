//
//  ContentView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    
    private var tabs : [String] = ["Quick", "Quality", "Resolution"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select Video", selection: $selectedTab, content: {
                    ForEach(0..<tabs.count, content: { index in
                        Text("\(tabs[index])")
                        
                    })
                }).pickerStyle(SegmentedPickerStyle())
                
                    
                    
                
                
                getSelectedTabView()
                
                Spacer()
                
            }
            .navigationTitle("Fast Compression")
            .toolbarBackground(Color("ToolbarBG"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
        
    }
    
    private func getSelectedTabView() -> AnyView {
        if(selectedTab == 0) {
            return AnyView(firstTabView)
        } else if(selectedTab == 1) {
            return AnyView(secondTabView)
        } else if(selectedTab == 2){
            return AnyView(thirdTabView)
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var firstTabView : some View {
        VStack{
            Text("First Tab")
                .font(.title)
        }
    }
    
    var secondTabView : some View {
        VStack{
            Text("Second Tab")
                .font(.title)
        }
    }
    
    var thirdTabView : some View {
        VStack{
            Text("Third Tab")
                .font(.title)
        }
    }
    
    init() {
        styleSegmentedView()
        
    }
    
    private func styleSegmentedView(){
        // Sets the background color of the Picker
//        UISegmentedControl.appearance().backgroundColor = .orange.withAlphaComponent(0.15)
        // Disappears the divider
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        
        // Changes the color for the selected item
//        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        // Changes the text color for the selected item
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
