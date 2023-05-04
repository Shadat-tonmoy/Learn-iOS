//
//  MultipleSheetsTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI

struct RandomModel : Identifiable {
    let id : String = UUID().uuidString
    let name : String
}


struct MultipleSheetsTest: View {
    
    @State var selectedModel : RandomModel = RandomModel(name: "Initial State")
    @State var showSheet : Bool = false
    
    var body: some View {
        VStack(spacing: 20, content: {
            HStack{
                Text("Show Sheet 1")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue)
                    )
                    .onTapGesture {
                        selectedModel = RandomModel(name: "Random Model 1")
                        showSheet.toggle()
                        
                    }
                
                Text("Show Sheet 2")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue)
                    )
                    .onTapGesture {
                        selectedModel = RandomModel(name: "Random Model 2")
                        showSheet.toggle()
                        
                    }
            }
            .sheet(isPresented: $showSheet, content: {
                
                SheetView(selectedModel: $selectedModel)
                
            })
            
        })
    }
}

struct MultipleSheetsTest_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsTest()
    }
}

struct SheetView: View {
    
    @Binding var selectedModel : RandomModel
    
    var body: some View {
        VStack{
            Text(selectedModel.name)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.orange)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white)
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
        .edgesIgnoringSafeArea(.all)
        
    }
}
