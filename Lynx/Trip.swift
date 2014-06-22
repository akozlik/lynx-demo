//
//  Trip.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class Trip {
    var route_id : String
    var service_id : String
    var trip_id : String
    var direction_id : String
    var shape_id : String
    
    var route : Route
    
    init(route_id:String, service_id:String, trip_id:String, direction_id:String, shape_id:String, route: Route) {
        self.route_id = route_id
        self.service_id = service_id
        self.trip_id = trip_id
        self.direction_id = direction_id
        self.shape_id = shape_id
        self.route = route
    }
}