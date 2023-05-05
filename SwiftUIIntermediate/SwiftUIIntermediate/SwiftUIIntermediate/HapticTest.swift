//
//  HapticTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/5/23.
//

import SwiftUI


class HapticManager{
    
    static let instance = HapticManager() // singleton
    
    func notification(type : UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style : UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}

struct HapticTest: View {
    let hapticManager = HapticManager.instance
    var body: some View {
        VStack(spacing : 20) {
            HapticTestButton(title: "Success")
                .onTapGesture { hapticManager.notification(type: .success) }
            
            HapticTestButton(title: "Warning")
                .onTapGesture {
                    hapticManager.notification(type: .warning)
                }
            
            HapticTestButton(title: "Error")
                .onTapGesture {
                    hapticManager.notification(type: .error)
                }
        }
    }
}

struct HapticTest_Previews: PreviewProvider {
    static var previews: some View {
        HapticTest()
    }
}

struct HapticTestButton : View {
    let title : String
    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.orange)
            )
    }
}
