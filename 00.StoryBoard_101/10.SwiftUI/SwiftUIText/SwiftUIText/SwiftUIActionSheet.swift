//
//  SwiftUIActionSheet.swift
//  SwiftUIText
//
//  Created by Shadat Tonmoy on 3/26/23.
//

import SwiftUI

struct SwiftUIActionSheet: View {
    @State var showActionSheet : Bool = false
    
    var body: some View {
        
        VStack{
            HStack{
                Circle()
                    .frame(width: 30)
                Text("@Username")
                Spacer()
                Button(action: {
                    showActionSheet.toggle()
                    
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.primary)
                })
                
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
                
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            getSheet()
        })
        
        
        
//        Button("Show Action Sheet",action : {
//            showActionSheet.toggle()
//
//        }).buttonStyle(.borderedProminent)
//            .tint(.orange)
//            .actionSheet(isPresented: $showActionSheet, content: {
//                ActionSheet(
//                    title: Text("Action Sheet")
//                        .font(.headline),
//                    buttons: [
//                        .default(Text("Option 1"), action: {
//
//                        }),
//                        .default(Text("Option 2"), action: {
//
//                        }),
//                        .default(Text("Option 3"), action: {
//
//                        })
//
//
//                    ]
//
//
//                )
//
//            })
            
    }
    
    func getSheet() -> ActionSheet{
        return ActionSheet(
            title: Text("Action Sheet")
                    .font(.headline),
                buttons: [
                    .default(Text("Option 1"), action: {

                    }),
                    .default(Text("Option 2"), action: {

                    }),
                    .default(Text("Option 3"), action: {

                    }),
                    .destructive(Text("Cancel"), action: {
                        
                    })
                    
                ]
        )
    }
    
    
}

struct SwiftUIActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIActionSheet()
    }
}
