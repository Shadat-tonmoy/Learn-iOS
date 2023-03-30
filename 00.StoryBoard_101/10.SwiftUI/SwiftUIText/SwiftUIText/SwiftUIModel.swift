//
//  SwiftUIModel.swift
//  SwiftUIText
//
//  Created by Tonmoy on 30/3/23.
//

import SwiftUI

struct UserModel : Identifiable {
    let id : String = UUID().uuidString
    let displayName : String
    let userName : String
    let followerCount : Int
    let isVerified : Bool
}

struct SwiftUIModel: View {
    
    let userList : [UserModel] = [
        UserModel(displayName: "Nick", userName: "nick1234", followerCount: 100, isVerified: true),
        UserModel(displayName: "Jone", userName: "jone234", followerCount: 504, isVerified: true),
        UserModel(displayName: "Andrew", userName: "and565", followerCount: 45, isVerified: false),
        UserModel(displayName: "Jonathon", userName: "jonathon98", followerCount: 14, isVerified: false),
        UserModel(displayName: "Steve", userName: "steve12", followerCount: 140, isVerified: true)
    ]
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(userList) { user in
                    HStack(spacing : 15) {
                        ZStack {
                            Circle()
                                .frame(width: 50)
                            if(user.isVerified){
                                Image(systemName: "check.fill")
                            }
                        }
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                            Text("@\(user.userName)")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(6)
                                .padding(.horizontal,5)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.purple)
                                        
                                
                                )
                        }
                    }
                }
            }
            .navigationTitle("User List")
        }
    }
}

struct SwiftUIModel_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIModel()
    }
}
