//
//  AdjustVolumeScreen.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/28/23.
//

import SwiftUI

struct AdjustVolumeScreen: View {
    
    @State var volumeValue = 50.0
    @State var muteVideo = false
    @Binding var showSheet : Bool
    @StateObject var viewModel : FastCompressionViewModel
    
    var body: some View {
        VStack(spacing : 10){
            
            VideoPropertyOptionHeaderView(title: "Adjust Volume", clickCallback: {
                viewModel.hideVolumeOptions()
            })
            
            HStack{
                
                Slider(value: $volumeValue, in: 1...100, step: 1.0)
                    .tint(Color.primaryColor)
                
                Spacer()
                Text("\(Int(volumeValue))%")
                    .font(.system(size: 14))
                    .frame(width: 50, alignment: .center)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.primaryColor)
                    )
                
            }
            
            Toggle("Mute Video", isOn: $muteVideo)
                .tint(Color.primaryColor)
                .padding(.top)
            
            HStack{
                Button("Cancel", action: {
                    showSheet = false
                    
                    
                })
                .frame(maxWidth: .infinity)
                .foregroundColor(.primaryColor)
                .padding(12)
                .background{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primaryColor)
                }
                
                Button("Done", action: {
                    showSheet = false
                    
                })
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(12)
                .background{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primaryColor)
                }
                
            }
            .padding(.top)
            Spacer()
        }
        .presentationDetents([.fraction(0.35)])
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct AdjustVolumeScreen_Previews: PreviewProvider {
    static var previews: some View {
        AdjustVolumeScreen(showSheet: .constant(true), viewModel: FastCompressionViewModel())
            .previewLayout(.sizeThatFits)
    }
}
