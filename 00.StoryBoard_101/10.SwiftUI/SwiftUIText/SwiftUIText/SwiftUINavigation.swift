//
//  SwiftUINavigation.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUINavigation: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                HStack(){
                    NavigationLink(destination: Option1Screen(), label: {
                        VStack {
                            Image(systemName: "video.fill")
                                .padding(.all,5)
                            Text("Option 1")
                        }.padding(.leading)
                        
                    })
                    Spacer()
                    NavigationLink(destination: Option2Screen(), label: {
                        VStack {
                            Image(systemName: "headphones")
                                .padding(.all,5)
                            Text("Option 2")
                        }
                        
                    })
                    Spacer()
                    NavigationLink(destination: Option3Screen(), label: {
                        VStack {
                            Image(systemName: "slider.vertical.3")
                                .padding(.all,5)
                            Text("Option 2")
                        }
                        .padding(.trailing)
                    })
                    
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(leading: NavigationLink(
                destination: Option1Screen(),
                label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)
                    
                }),trailing: NavigationLink(destination: Option1Screen(), label: {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.black)
                    
                })
            
            )
        }
        
        
        
    }
}

struct Option1Screen : View{
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.purple.edgesIgnoringSafeArea(.all)
                Text("Welcome To Option 1")
            }
        }
        .navigationTitle("Option 1")
    }
}


struct Option2Screen : View{
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.green.edgesIgnoringSafeArea(.all)
                Text("Welcome to option 2")
            }
        }
        .navigationTitle(
            Text("Option 4")
            
            
        )
    }
}

struct Option3Screen : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.yellow.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to option 3")
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Back")
                            .padding()
                            .foregroundColor(.yellow)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                            )
                    })
                }
            }
        }
        .navigationTitle("Option 3")
    }
}

struct SwiftUINavigation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigation()
    }
}
