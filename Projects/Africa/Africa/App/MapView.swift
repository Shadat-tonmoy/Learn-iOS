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
            
            MapAnnotation(coordinate: location.location, content: {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            })
            
            
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
