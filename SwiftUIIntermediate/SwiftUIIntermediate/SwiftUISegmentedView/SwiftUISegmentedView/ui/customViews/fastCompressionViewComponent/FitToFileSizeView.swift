//
//  FitToFileSizeView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 6/3/23.
//

import SwiftUI

struct FitToFileSizeView: View {
    
    @State var fileSizeValue = "16"
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment:.leading){
                VideoPropertyOptionHeaderView(title: "Expected File Size", clickCallback: {
                    viewModel.hideFiteToFileSizeOptions()
                })
                
                VStack(alignment: .leading){
                    Divider()
                    
                    HStack {
                        TextField("File Size In MB", text: $fileSizeValue)
                            .keyboardType(.decimalPad)
                    }
                    .padding(.vertical)
                    
                    Text("Common File Sizes")
                        .font(.headline)
                        .padding(.vertical, 10)
                    
                    Divider()
                    
                    ForEach(CommonFileSizeRepo.options, content: { CommonFileSize in
                        Text(CommonFileSize.title)
                            .padding(.vertical, 10)
                            .font(.headline)
                        
                    })
                    
                    HStack {
                        Text("Cancel")
                            .padding()
                            .onTapGesture {
                                viewModel.hideFiteToFileSizeOptions()
                            }
                        
                        Text("Proceed")
                            .foregroundColor(.primaryColor)
                            .padding()
                    }
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                Spacer()
            }
            .presentationDetents([.fraction(0.60)])
        }
    }
    
    private func getScreenHeightPercentage(contentHeight : CGFloat) {
        let screenHeight = UIScreen.main.bounds.height
        let percentage = (contentHeight / screenHeight) * 100
        print("ScreenHeight : \(screenHeight), contentHeight : \(contentHeight), percentage : \(percentage)")
        
    }
}

struct FitToFileSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FitToFileSizeView(viewModel: FastCompressionViewModel())
    }
}
