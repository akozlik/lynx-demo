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
        println(routes)
        
        for route in routes {
            println(route.route_long_name)
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
    
    
    
    // Load routes from CSV file
    func loadRoutes() -> Route[] {
        var path = NSBundle.mainBundle().pathForResource("routes", ofType: "txt")
        var string = NSString.stringWithContentsOfFile(path) as String
        
        var tempLines:String[] = string.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as String[]
        
        var lines:String[] = []
        
        
        for line in tempLines {
            if line != "" {
                lines.append(line);
            }
        }
        
        // Remove the headerline
        lines.removeAtIndex(0)
        
        var routes: Route[] = []
        
        for line in lines {
            var elements = line.componentsSeparatedByString(",")
            
            // Trim strings
            for var i = 0; i < elements.count; i++ {
                var trimmedElement = elements[i].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as String
                elements[i] = trimmedElement;
            }
            
            var route_id = elements[0].toInt()
            var route_short_name = elements[1]
            var route_long_name = elements[2]
            var route_type = elements[3].toInt()
                        
            var route = Route(route_id: route_id!, route_short_name: route_short_name, route_long_name: route_long_name, route_type: route_type!)
            
            routes.append(route)
        }
        
        return routes
    }
    
}