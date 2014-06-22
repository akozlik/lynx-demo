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
    var shape_id : String
    var shape_pt_lat: Double
    var shape_pt_lon : Double
    var shape_pt_sequence : String
    var shape_dist_traveled : Double
    var coordinate : CLLocationCoordinate2D
    
    init() {
        self.shape_id = ""
        self.shape_pt_lat = 0.0
        self.shape_pt_lon = 0.0
        self.shape_pt_sequence = ""
        self.shape_dist_traveled = 0.0
        self.coordinate = CLLocationCoordinate2DMake(self.shape_pt_lat, self.shape_pt_lon)
    }
    
    init(shape_id:String, shape_pt_lat:Double, shape_pt_lon:Double, shape_pt_sequence:String, shape_dist_traveled:Double) {
        self.shape_id = shape_id
        self.shape_pt_lat = shape_pt_lat
        self.shape_pt_lon = shape_pt_lon
        self.shape_pt_sequence = shape_pt_sequence
        self.shape_dist_traveled = shape_dist_traveled
        
        self.coordinate = CLLocationCoordinate2D(latitude: self.shape_pt_lat, longitude: self.shape_pt_lon)
        
    }
}