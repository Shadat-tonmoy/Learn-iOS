//
//  SwiftUIConditional.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/25/23.
//

import SwiftUI

struct SwiftUIConditional: View {
    
    @State var counter = 0
    @State var showCircle : Bool = true
    @State var timerText = "Hello 0"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        VStack{
            Button(action: {
                showCircle.toggle()
                
            }, label: {
                Text("Show Circle")
            })
            
            if(showCircle) {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            
            
            ProgressView()
                .padding(.top)
            
            Text(timerText)
                .padding(.top)
                .onReceive(timer, perform: { input in
                    counter += 1
                    timerText = "Hello : \(counter)"
                    
                    
                })
            
            Spacer()
            
            
            
        }
    }
}

struct SwiftUIConditional_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIConditional()
    }
}
