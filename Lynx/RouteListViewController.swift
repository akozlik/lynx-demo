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
        
        var routeQuery = PFQuery(className: "Route")
        
        var routes = routeQuery.findObjects()
        
        for routeObj in routes {
            
        }
        
        println(routes)
        
        self.routes = RoutesDAO().loadRoutesFromCSV()
        
        for route in routes {
//            println(route.route_long_name)
        }
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
        
        cell!.textLabel.text = route.route_long_name
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)  {
//        Route route = self.routes[0]
        var route = self.routes[indexPath.row]
        
        println(route.route_long_name)
        
        var tripListVC : TripListViewController = storyboard.instantiateViewControllerWithIdentifier("TripListViewController") as TripListViewController
        tripListVC.route = route;
        
        self.navigationController.pushViewController(tripListVC, animated: true)


    }
    
     
}