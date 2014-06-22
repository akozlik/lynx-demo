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
    
    var shape = Shape()
    
    override func viewDidLoad()  {
        

        mapView.centerCoordinate = shape.coordinate
    }
    
    
}