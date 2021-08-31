//
//  String+Extension.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/31/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation

extension String{
    func englishLettersOnly()-> Bool{
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z \n].*", options: [])
            if regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil {
                return false
            }
        }
        catch {
            print("Error in Using Search Bar")
        }
        return true
    }
    
}

