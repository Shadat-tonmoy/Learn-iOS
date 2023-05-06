//
//  ContentView.swift
//  BackgroundThreadTest
//
//  Created by Shadat Tonmoy on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel : BackgroundThreadViewModel = BackgroundThreadViewModel()
    @State var isLoading = true
    
    var body: some View {
        VStack {
            
            if (isLoading){
                ProgressView()
                    .padding(.top, UIScreen.main.bounds.height * 0.3)
            }
            
            List(viewModel.data, id: \.self, rowContent: { item in
                Text(item)
                    .font(.title)
                
            })
            .listStyle(.plain)
            .onReceive(viewModel.$data, perform: { data in
                if(data.count > 0) {
                    isLoading = false
                }
                
            })
            Spacer()
            
            Text("Fetch Data")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.purple)
                )
                .padding(.horizontal)
                .onTapGesture {
                    isLoading = true
                    viewModel.fetchData()
                }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
