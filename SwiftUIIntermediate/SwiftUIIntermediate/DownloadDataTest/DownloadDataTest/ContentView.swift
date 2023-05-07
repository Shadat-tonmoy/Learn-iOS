//
//  ContentView.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel : DownloadDataViewModel = DownloadDataViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if let postList = viewModel.postModel {
                    List(postList, id: \.self, rowContent: { post in
                        ZStack{
                            PostItemView(postModel: post)
                            NavigationLink(destination : PostDetailsView(postModel: post)){
                                EmptyView()
                            }
                            .opacity(0)
                            
                        }
                        
                        
                        
                    })
                    .listStyle(.plain)
                }
                Spacer()
            }
            .navigationTitle("Posts")
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PostItemView: View {
    let postModel : PostModel
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(postModel.title)
                .font(.title2)
                .lineLimit(1)
                .fontWeight(.semibold)
            
            Text(postModel.body)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(.black.opacity(0.6))
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.horizontal,8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 2)
        )
    }
}
