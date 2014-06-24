//
//  RoutesDAO.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class RoutesDAO : CSVDAO {
    // Load routes from CSV file
    func loadRoutesFromCSV() -> Route[] {
        
        var elements = self.loadCSVLines("routes", type: "txt")
        
        var routes: Route[] = []
        
        for element in elements {
            
            var route_id = element["route_id"]!
            var route_short_name = element["route_short_name"]!
            var route_long_name = element["route_long_name"]!
            var route_type = element["route_type"]!
            
            var route = Route(route_id: route_id, route_short_name: route_short_name, route_long_name: route_long_name, route_type: route_type)
            
            routes.append(route)
        }
        
        
        return routes
    }
    
    func loadRoutesFromParseObjects(objects: PFObject[]) -> Route[] {
        var routes: Route[] = []
        
        for routeObj in objects {
            
            var route_id = routeObj.objectForKey("route_id")
            var route_short_name = routeObj.objectForKey("route_short_name")!
            var route_long_name = routeObj.objectForKey("route_long_name")!
            var route_type = routeObj.objectForKey("route_type")!
            
            var route = Route(route_id: route_id, route_short_name: route_short_name, route_long_name: route_long_name, route_type: route_type)
            
            routes.append(route)

        }
    }
   
}