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

        shapePoints.sort({ $0.shape_pt_sequence < $1.shape_pt_sequence })

        for shape in shapePoints {
            println(shape.shape_pt_sequence)
            coordinates.append(shape.coordinate)
        }
        
        var polyline : MKPolyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
        
        mapView.addOverlay(polyline, level: MKOverlayLevel.AboveRoads)
        

        var timesQuery = PFQuery(className: "StopTime")
        timesQuery.whereKey("trip_id", equalTo: self.trip.trip_id)
        timesQuery.limit = 1000
        
        var parseTimes = timesQuery.findObjects()
        
        var stops : PFObject[] = []
        
        var stopIDs : String[] = []
        for timeObj in parseTimes {
            if timeObj is PFObject {
                var temp = timeObj as PFObject
                var stop_id = timeObj.objectForKey("stop_id") as String
                
                stopIDs.append(stop_id)
            }
        }
        

        var stopQuery = PFQuery(className: "Stop")
        stopQuery.whereKey("stop_id", containedIn: stopIDs)
        var parseStops = stopQuery.findObjects()

        for stop in parseStops {
            var lynxStop = stop as PFObject

            var lat = lynxStop.objectForKey("stop_lat")?.doubleValue
            var lon = lynxStop.objectForKey("stop_lon")?.doubleValue
            var coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
            
            var annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = stop.objectForKey("stop_name") as String
            mapView.addAnnotation(annotation)
        }
        
        zoomToPolyline(mapView, polyline: polyline, animated: true)

    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {

        if overlay is MKPolyline {
            var renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(red: 0.83, green: 0.47, blue: 0.47, alpha: 1)
            renderer.lineWidth = 5.0
            return renderer
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("MKPinAnnotationView")

        if (!annotationView) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MKPinAnnotationView")
        }

        // set your custom image
        annotationView.image = UIImage(named: "lynx-logo")

        return annotationView;

    }

    func zoomToPolyline(mapview : MKMapView, polyline : MKPolyline, animated : Bool) {
        var polygon = MKPolygon(points: polyline.points(), count: polyline.pointCount)

        mapView.setVisibleMapRect(polyline.boundingMapRect, animated: animated)
    }

}