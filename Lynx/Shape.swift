//
//  Shape.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import MapKit

class Shape {
    var shape_id : Int
    var shape_pt_lat: Double
    var shape_pt_lon : Double
    var shape_pt_sequence : Int
    var shape_dist_traveled : Double
    var coordinate : CLLocationCoordinate2D
    
    init(shape_id:Int, shape_pt_lat:Double, shape_pt_lon:Double, shape_pt_sequence:Int, shape_dist_traveled:Double) {
        self.shape_id = shape_id
        self.shape_pt_lat = shape_pt_lat
        self.shape_pt_lon = shape_pt_lon
        self.shape_pt_sequence = shape_pt_sequence
        self.shape_dist_traveled = shape_dist_traveled
        
        self.coordinate = CLLocationCoordinate2D(latitude: self.shape_pt_lat, longitude: self.shape_pt_lon)
        
    }
}