//
//  Stop.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import MapKit

class Stop {
    
    var stop_id: Int
    var stop_name: String
    var stop_lat: Double
    var stop_lon: Double
    var location_type: Int
    var coordinate : CLLocationCoordinate2D
    
    init(stop_id:Int, stop_name:String, stop_lat:Double, stop_lon:Double, location_type:Int) {
        self.stop_id = stop_id
        self.stop_name = stop_name
        self.stop_lat = stop_lat
        self.stop_lon = stop_lon
        self.location_type = location_type
        
        self.coordinate = CLLocationCoordinate2D(latitude: self.stop_lat, longitude: self.stop_lon)
    }
    
}