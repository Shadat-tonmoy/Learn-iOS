//
//  LocationModel.swift
//  Africa
//
//  Created by Shadat Tonmoy on 4/19/23.
//

import SwiftUI
import MapKit

struct Location : Codable, Identifiable, Hashable{
    
    let id : String
    let name : String
    let image : String
    let latitude : Double
    let longitude : Double
    
    var location : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
