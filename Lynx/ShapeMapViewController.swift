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
    
    override func viewDidLoad()  {
        var coordinates : CLLocationCoordinate2D[] = []
        
        
        
        for shape in shapePoints {
            var annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(28.6614, -81.3919) //shape.coordinate
            annotation.title = "Something"
            
            var region = MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.1, 0.1))
            mapView.setRegion(region, animated: false)
            
            coordinates.append(shape.coordinate)
            
            
        }
        
        var polyline : MKPolyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
        
        mapView.addOverlay(polyline, level: MKOverlayLevel.AboveRoads)
        
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