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
        
        return shapePoints
    }
}
