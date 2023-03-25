//
//  GridSwiftUI.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/22/23.
//

import SwiftUI

struct User{
    let firstName : String
    let lastName : String
    let email : String
    
    func getIconText() -> String{
        let index = firstName.index(firstName.startIndex, offsetBy: 1)
        return String(firstName[..<index])
    }
}

struct GridSwiftUI: View {
    let dataSet = [
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy.fb@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy.fb@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy.fb@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy@gmail.com"),
        User(firstName: "Shadat", lastName: "Tonmoy", email: "shadat.tonmoy.fb@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
        User(firstName: "AppHere", lastName: "Studio", email: "stappsbd@gmail.com"),
    ]
    
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: .infinity), spacing: nil) 
    
    ]

    fileprivate func getUserRow(user : User) -> some View {
        return HStack(spacing: 4){
            Circle()
                .fill(Color("backgroundColor"))
                .frame(width: 50)
                .overlay(
                    Text(user.getIconText())
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                )
            
            VStack{
                
                Text("\(user.firstName) \(user.lastName)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,2)
                    .padding(.leading,8)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(verbatim: user.email)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,8)
                    .font(.caption)
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(8)
    }
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(dataSet.indices) { index in
                    getUserRow(user: dataSet[index])
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        
    }
}

struct GridSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        GridSwiftUI()
    }
}
