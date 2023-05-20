//
//  QualityCompressionView.swift
//  SwiftUISegmentedView
//
//  Created by Shadat Tonmoy on 5/11/23.
//

import SwiftUI

struct QualityCompressionView: View {
    
    @StateObject private var viewModel = QualityCompressViewModel()
    
    var body: some View {
        VStack{
            
        }
    }
}

struct QualityCompressionView_Previews: PreviewProvider {
    static var previews: some View {
        QualityCompressionView()
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}
