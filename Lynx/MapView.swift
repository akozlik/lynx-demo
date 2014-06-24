//
//  MapView.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/23/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapView : MKMapView, MKMapViewDelegate {
    
    
    override func viewForAnnotation(annotation: MKAnnotation!) -> MKAnnotationView!  {
        var annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        return annotationView
    }
}