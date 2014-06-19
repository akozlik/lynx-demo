//
//  RouteListViewController.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/18/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit

class RouteListViewController : UITableViewController {
    
    var routes : Route[] = []
    
    override func viewDidLoad()  {
        
        self.title = "Routes"
        
        self.routes = loadRoutes();
//        println(routes)
        
        for route in routes {
//            println(route.route_long_name)
        }
        

        
        // We should now have
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int  {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return routes.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell
        
        if (!cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellIdentifier")
        }
        
        var route = self.routes[indexPath.row]
        
//        cell!.textLabel.text = route.route_long_name
//        cell!.detailTextLabel.text = "Something"
        
        cell!.textLabel.text = route.route_long_name
//        cell!.detailTextLabel.text = "Kozlik"
        
        return cell
    }
    
    func getTripsForRoute(route:Route) -> Trip[] {
        var trips : Trip[] = [];
        
        return trips
        
    }
    
    func loadCSVLines(filename:String, type:String) -> Dictionary<String, AnyObject>[] {
        var path = NSBundle.mainBundle().pathForResource(filename, ofType:type)
        var string = NSString.stringWithContentsOfFile(path) as String
        
        var tempLines:String[] = string.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as String[]
        
        var lines:String[] = []
        
        
        for line in tempLines {
            if line != "" {
                lines.append(line);
            }
        }
        
        // Remove the headerline
        var keys = lines[0].componentsSeparatedByString(",")
        lines.removeAtIndex(0)
        
        var returnElements : Dictionary<String, AnyObject>[] = []
        
        for line in lines {
            var elements = line.componentsSeparatedByString(",")
            
            var returnDict : Dictionary<String, AnyObject> = Dictionary()
            // Trim strings
            for var i = 0; i < elements.count; i++ {
                var trimmedElement = elements[i].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as String
                elements[i] = trimmedElement;

                returnDict[keys[i]] = trimmedElement
            }

            returnElements.append(returnDict)
        }
        
        return returnElements
    }
    
    // Load routes from CSV file
    func loadRoutes() -> Route[] {
        var elements:Dictionary<String, AnyObject>[] = loadCSVLines("routes", type: "txt") as Dictionary<String, AnyObject>[]
        
        var routes: Route[] = []
        

        for element in elements {
            
            var route_id = element["route_id"]?.integerValue
            var route_short_name = element["route_short_name"] as String?
            var route_long_name = element["route_long_name"] as String?
            var route_type = element["route_type"]?.integerValue
            
            var route = Route(route_id: route_id, route_short_name: route_short_name, route_long_name: route_long_name, route_type: route_type)
            
//            routes.append(route)

            println(route_long_name)
            println(element["route_short_name"])

//            println(element)
        }

        
        return routes
    }
    
}