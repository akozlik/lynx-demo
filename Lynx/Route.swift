//
//  Route.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class Route {
    var route_id: String
    var route_short_name : String
    var route_long_name : String
    var route_type : String
    
    init(route_id:String, route_short_name:String, route_long_name:String, route_type:String) {
        self.route_id = route_id
        self.route_short_name = route_short_name
        self.route_long_name = route_long_name
        self.route_type = route_type
    }
}
