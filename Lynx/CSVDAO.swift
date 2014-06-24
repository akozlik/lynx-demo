//
//  CSVDAO.swift
//  Lynx
//
//  Created by Andrew Kozlik on 6/22/14.
//  Copyright (c) 2014 Andrew Kozlik. All rights reserved.
//

import Foundation

class CSVDAO {
    func loadCSVLines(filename:String, type:String) -> Dictionary<String, String>[] {
        
        var path = NSBundle.mainBundle().pathForResource(filename, ofType:type)
        
        // Make sure we've got a file there
        var returnElements : Dictionary<String, String>[] = []
        if (path) {
            var string = NSString.stringWithContentsOfFile(path) as String
            
            var tempLines:String[] = string.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as String[]
            
            var lines:String[] = []
            
            
            for line in tempLines {
                if line != "" {
                    lines.append(line);
                }
            }
            
            // Remove the headerline
            var keys = lines[0].componentsSeparatedByString(",")
            lines.removeAtIndex(0)
            
            for line in lines {
                var elements = line.componentsSeparatedByString(",")
                
                var returnDict : Dictionary<String, String> = Dictionary()
                // Trim strings
                for var i = 0; i < elements.count; i++ {
                    var trimmedElement = elements[i].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as String
                    elements[i] = trimmedElement;
                    
                    returnDict[keys[i]] = trimmedElement
                }
                
                returnElements.append(returnDict)
                
            }
        }
        
        return returnElements
    }
}