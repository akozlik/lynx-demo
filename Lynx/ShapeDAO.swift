//
//  ShapeDAO.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class ShapeDAO : CSVDAO {
    
    func getShapePointsForShapeID(shape_id : String) -> Shape[] {
        var lines = self.loadCSVLines("shapes", type: "txt")
        
        var shapePoints : Shape[] = []
        
        var foundShapes : String[] = []
        
        for line in lines {
            
            var shape_id_line = line["shape_id"]!

            var found = false;
            
            if (shape_id == shape_id_line) {
                found = true;
                
                var shape_pt_lat : Double = NSString(line["shape_pt_lat"]!).doubleValue
                var shape_pt_lon : Double = NSString(line["shape_pt_lon"]!).doubleValue
                var shape_pt_sequence = line["shape_pt_sequence"]!
                var shape_dist_traveled : Double = NSString(line["shape_dist_traveled"]!).doubleValue
                
                var shape = Shape(shape_id: shape_id, shape_pt_lat: shape_pt_lat, shape_pt_lon: shape_pt_lon, shape_pt_sequence: shape_pt_sequence, shape_dist_traveled: shape_dist_traveled)
                
                shapePoints.append(shape)
                
            }
            
            if (found && shape_id_line != shape_id) {
                break;
            }
        }
        
        return shapePoints
    }
    
    func loadShapesFromParseObjects(objects: AnyObject[]) -> Shape[] {
        var shapes: Shape[] = []
        
        for shapeObj in objects {
            if shapeObj is PFObject {
                var temp = shapeObj as PFObject
                
                var shape_dist_traveled = temp.objectForKey("shape_dist_traveled").doubleValue
                var shape_id = temp.objectForKey("shape_id") as String
                var shape_pt_lat = temp.objectForKey("shape_pt_lat").doubleValue
                var shape_pt_lon = temp.objectForKey("shape_pt_lon").doubleValue
                var shape_pt_sequence = temp.objectForKey("shape_pt_sequence") as String
                
                println(shape_pt_lat)

                var shape = Shape(shape_id: shape_id, shape_pt_lat: shape_pt_lat, shape_pt_lon: shape_pt_lon, shape_pt_sequence: shape_pt_sequence, shape_dist_traveled: shape_dist_traveled)
                
                shapes.append(shape)
            }
        }
        
        return shapes
    }

}
