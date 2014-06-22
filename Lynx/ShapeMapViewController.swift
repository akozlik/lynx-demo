//
//  ShapeMapViewController.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ShapeMapViewController : UIViewController {
    
    @IBOutlet var mapView : MKMapView =  MKMapView()
    
    var shapePoints : Shape[] = []
    
    override func viewDidLoad()  {
        
        for shape in shapePoints {
            var annotation = MKPointAnnotation()
            annotation.coordinate = shape.coordinate
            annotation.title = "Something"
            mapView.addAnnotation(annotation)
            
            var region = MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.1, 0.1))
            mapView.setRegion(region, animated: false)
        }
    }
    
    
}