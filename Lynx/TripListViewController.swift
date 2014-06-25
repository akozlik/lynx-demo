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
    var shape : Shape = Shape(shape_id: "0", shape_pt_lat: 0.0, shape_pt_lon: 0.0, shape_pt_sequence: 0.0, shape_dist_traveled: 0.0)
    var shapePoints : Shape[] = []
    var selectedTrip : Trip = Trip(route_id: "", service_id: "", trip_id: "", direction_id: "", shape_id: "")
    
    override func viewDidLoad()  {
        self.title = "Trips"
        
        var tripQuery = PFQuery(className: "Trip")

        tripQuery.whereKey("route_id", equalTo: route.route_id)
    
        var parseTrips = tripQuery.findObjects()
        
        self.trips = TripsDAO().loadTripsFromParseObjects(parseTrips)
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


        var shapeQuery = PFQuery(className: "Shape")
        shapeQuery.whereKey("shape_id", equalTo: trip.shape_id)
        shapeQuery.limit = 1000
        
        var parseShapes = shapeQuery.findObjects()
        
        self.shapePoints = ShapeDAO().loadShapesFromParseObjects(parseShapes)
        self.selectedTrip = trip
        
        self.performSegueWithIdentifier("shapeMap", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)  {

        if segue.identifier == "shapeMap" {
            var shapeVC : ShapeMapViewController = segue.destinationViewController as ShapeMapViewController
            shapeVC.trip = self.selectedTrip
            shapeVC.shapePoints = self.shapePoints
        }
    }
}