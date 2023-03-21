//
//  MICard.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/21/23.
//

import SwiftUI

struct MICard: View {
    
    fileprivate func getAvatar() -> some View {
        return Image("bg_image")
            .resizable()
            .frame(width: 150.0, height: 150.0)
            .clipShape(Circle())
            .padding(.top,96)
            .padding(.bottom, 16)
    }
    
    fileprivate func getName() -> Text {
        return Text("Name Goes Here")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
    
    fileprivate func getDivider() -> some View {
        return Divider()
            .frame(width: 350)
            .background(.white)
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("backgroundColor"))
            VStack(alignment: .center, content: {
                            
                getAvatar()
                
                getDivider()
                
                getName()
                
                Text("Designation Goes Here")
                    .font(.system(size: 18.0))
                    .foregroundColor(.white)
                
                VStack(content: {
                    
                    Text("Hello World")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                        .foregroundColor(Color("cardTextColor"))
                    
                    Text("This is a very long text. It will not be fit into a single line so we must go into multiple line to display it properly into the UI.We also need to take care of other stuff!")
                        .frame(width: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .foregroundColor(Color("cardTextColor"))
                        
                }).background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                )
                .padding(.all)
                .shadow(radius: 5)
                    
                
                Spacer()
            })
            
            
            
        }.ignoresSafeArea()
    }
}

struct MICard_Previews: PreviewProvider {
    static var previews: some View {
        MICard()
    }
}
