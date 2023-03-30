//
//  SwiftUISafeGuard.swift
//  SwiftUIText
//
//  Created by Tonmoy on 30/3/23.
//

import SwiftUI

struct SwiftUISafeGuard: View {
    @State var myText : String? = nil
    @State var isLoading = false
    var loggedInUserId : String? = nil // "abc1223"
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("This is a normal text")
                        .font(.headline)
                    if let text = myText{
                        Text(text)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                    }
                    
                    if (isLoading){
                        ProgressView()
                    }
                }
                .onAppear{
                    loadData()
                }
            }
            .navigationTitle("If Let")
        }
    }
    
    func loadData(){
        if let userId = loggedInUserId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                myText = "New text updated with id \(loggedInUserId)"
                isLoading = false
            })
        } else {
            myText = "Invalid Logged in user id"
        }
        
    }
    
    func loadData2(){
        guard let userId = loggedInUserId else {
            myText = "Invalid Logged in user id"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            myText = "New text updated with id \(loggedInUserId)"
            isLoading = false
        })
    }
}

struct SwiftUISafeGuard_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISafeGuard()
    }
}
