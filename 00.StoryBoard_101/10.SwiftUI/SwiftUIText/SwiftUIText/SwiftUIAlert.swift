//
//  SwiftUIAlert.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIAlert: View {
    
    @State var showAlert = false
    @State var backgrounColor = Color.green
    
    var body: some View {
        ZStack {
            
            backgrounColor.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showAlert.toggle()
            },
            label : {
                getButtonLabel()
            })
            .alert(isPresented: $showAlert, content: {
    //            Alert(title: Text("There was an error!"))
                getAlert()
                
            })
        }
    }
    
    func getAlert() -> Alert{
        return Alert(
            title: Text("Title of the alert"),
            message: Text("Title message will be displayed here"),
            primaryButton: .default(Text("Got it"), action: {
                if(backgrounColor == Color.purple){
                    backgrounColor = Color.green
                } else {
                    backgrounColor = Color.purple
                }
                
            }),
            secondaryButton: .destructive(Text("No Thanks")))
    }
    
    func getButtonLabel() -> some View{
        return Text("Change Background Color")
            .padding()
            .foregroundColor(backgrounColor)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .shadow(radius: 4)
            )
    }
}

struct SwiftUIAlert_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAlert()
    }
}
