//
//  TripsDAO.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class TripsDAO : CSVDAO {
    
    /* Routing Methods */
    
    var trips : Trip[] = []

    func getTripsForRoute(route:Route) -> Trip[] {

        var trips : Trip[] = [];
        
        var tripLines = self.loadCSVLines("trips", type: "txt")
        
        var stopTimes = self.loadCSVLines("stop_times", type: "txt")

        var found = false
        
        var start = 0
        
        var shape_ids : String[] = []
        
        for line in tripLines {

            var route_id_line = line["route_id"]
            
            if route_id_line == route.route_id {
                found = true
                
                var route_id = line["route_id"]!
                var service_id = line["service_id"]!
                var trip_id = line["trip_id"]!
                var direction_id = line["direction_id"]!
                var shape_id = line["shape_id"]!
                
                var trip = Trip(route_id: route_id, service_id: service_id, trip_id: trip_id, direction_id: direction_id, shape_id: shape_id, route: route)
                
                
                var found = false;
                for temp_shape_id in shape_ids {
                    if temp_shape_id == shape_id {
                        found = true;
                    }
                }
                
                if (!found) {
                    trips.append(trip)
                    shape_ids.append(shape_id)
                }
            }
            
            // Check to see if we reached the end of the group
            if (found && route_id_line != route.route_id) {
                break;
            } 
        }
        
        return trips
        
    }
    
}