//
//  MapView.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/16/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region : MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [Location] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations,annotationContent: { location in
            
//            MapPin(coordinate: location.location, tint: .accentColor)
            
//            MapMarker(coordinate: location.location, tint: .accentColor)
            
//            MapAnnotation(coordinate: location.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32)
//            })
            
            MapAnnotation(coordinate: location.location, content: {
                MapAnnotationView(location: location)
            })
            
            
        })
        .overlay(alignment: .topLeading, content: {
            HStack(spacing : 15){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 5){
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.heavy)
                    }
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.heavy)
                    }
                }
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            
            )
            .padding(.top, 30)
            .padding(.horizontal, 30)
            
        })
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
