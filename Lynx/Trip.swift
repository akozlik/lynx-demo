//
//  Trip.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class Trip {
    var route_id : Int
    var service_id : Int
    var trip_id : Int
    var direction_id : Int
    var shape_id : Int
    
    var route : Route
    
    init(route_id:Int, service_id:Int, trip_id:Int, direction_id:Int, shape_id:Int, route: Route) {
        self.route_id = route_id
        self.service_id = service_id
        self.trip_id = trip_id
        self.direction_id = direction_id
        self.shape_id = shape_id
        self.route = route
    }
}