//
//  PostDetailsView.swift
//  DownloadDataTest
//
//  Created by Shadat Tonmoy on 5/7/23.
//

import SwiftUI

struct PostDetailsView: View {
    
    let postModel : PostModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment : .center){
                Text(postModel.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(postModel.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black.opacity(0.6))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(postModel: PostModel(userId: 1, id: 1, title: "Test Post", body: "This is the post"))
    }
}
