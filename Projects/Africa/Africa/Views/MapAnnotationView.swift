//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/20/23.
//

import SwiftUI
import MapKit

struct MapAnnotationView: View {
    
    let location : Location
    @State private var animation : Double = 0.0
    
    var body: some View {
        ZStack{
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1.0
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static let locationList : [Location] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locationList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
