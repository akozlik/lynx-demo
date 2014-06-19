//
//  StopTime.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class StopTime {
    var trip_id: Int
    var arrival_time: NSDate
    var departure_time: NSDate
    var stop_id: Int
    var stop_sequence: Int
    var shape_dist_traveled: Double
    
    init(trip_id:Int, arrival_time:NSDate, departure_time:NSDate, stop_id:Int, stop_sequence:Int, shape_dist_traveled:Double)
    {
        self.trip_id = trip_id
        self.arrival_time = arrival_time
        self.departure_time = departure_time
        self.stop_id = stop_id
        self.stop_sequence = stop_sequence
        self.shape_dist_traveled = shape_dist_traveled
    }
    
}