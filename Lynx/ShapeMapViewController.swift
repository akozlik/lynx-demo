//
//  ShapeMapViewController.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import UIKit
import MapKit

class ShapeMapViewController : UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView : MKMapView =  MKMapView()
    
    var shapePoints : Shape[] = []
    var trip : Trip = Trip(route_id: "", service_id: "", trip_id: "", direction_id: "", shape_id: "")
    
    override func viewDidLoad()  {
        var coordinates : CLLocationCoordinate2D[] = []

        // Load up the coordinates from the shape file
        for shape in shapePoints {
            coordinates.append(shape.coordinate)
        }
        
        var polyline : MKPolyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
        
        mapView.addOverlay(polyline, level: MKOverlayLevel.AboveRoads)
        
        
        var timesQuery = PFQuery(className: "StopTime")
        timesQuery.whereKey("trip_id", equalTo: self.trip.trip_id)
        
        var parseTimes = timesQuery.findObjects()
        
        var stops : PFObject[] = []
        
        for timeObj in parseTimes {
            if timeObj is PFObject {
                var temp = timeObj as PFObject
                var stop_id = timeObj.objectForKey("stop_id") as String
                
                var stopQuery = PFQuery(className: "Stop")
                stopQuery.whereKey("stop_id", equalTo: stop_id)
                
                var parseStops = stopQuery.findObjects()
                
                for stopObj in parseStops {
                    if stopObj is PFObject {
                        var stop = stopObj as PFObject
                        stops.append(stop)
                    }
                }
            }
        }
        
        println(stops)
        
        for stop in stops {
            var lynxStop = stop as PFObject
            
        }
        
        zoomToPolyline(mapView, polyline: polyline, animated: true)

    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        var renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 0.83, green: 0.47, blue: 0.47, alpha: 1)
        renderer.lineWidth = 5.0
        
        return renderer
    }

    func zoomToPolyline(mapview : MKMapView, polyline : MKPolyline, animated : Bool) {
        var polygon = MKPolygon(points: polyline.points(), count: polyline.pointCount)

        mapView.setVisibleMapRect(polyline.boundingMapRect, animated: animated)
    }

}