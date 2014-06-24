//
//  TripListViewController.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit

class TripListViewController : UITableViewController {
    var route : Route = Route(route_id: "", route_short_name: "", route_long_name: "", route_type: "")
    var trips : Trip[] = []
    var shape : Shape = Shape(shape_id: "0", shape_pt_lat: 0.0, shape_pt_lon: 0.0, shape_pt_sequence: "0", shape_dist_traveled: 0.0)
    var shapePoints : Shape[] = []
    
    override func viewDidLoad()  {
        self.title = "Trips"
        println("loaded trips")
        
        self.trips = TripsDAO().getTripsForRoute(route)
        println(self.trips)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int  {
        return 1;
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return self.trips.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell
        
        if (!cell) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CellIdentifier")
        }
        
        var trip = self.trips[indexPath.row]
        cell!.textLabel.text = trip.trip_id
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)  {
        
        var trip = self.trips[indexPath.row]


        self.shapePoints = ShapeDAO().getShapePointsForShapeID(trip.shape_id) as Shape[]
        

        self.performSegueWithIdentifier("shapeMap", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)  {

        if segue.identifier == "shapeMap" {
            var shapeVC : ShapeMapViewController = segue.destinationViewController as ShapeMapViewController
            shapeVC.shapePoints = self.shapePoints
        }
    }
}