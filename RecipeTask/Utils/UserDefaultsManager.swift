//
//  UserDefaultsManager.swift
//  RecipeTask
//
//  Created by Dina Adel on 9/1/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class UserDefaultsManager{
    static func set(array: [String]){
        UserDefaults.standard.set(array, forKey: Key.SAVED_STRING_ARRAY.rawValue)
    }
    static func get()-> [String]?{
        let array = UserDefaults.standard.stringArray(forKey: Key.SAVED_STRING_ARRAY.rawValue)
        return array
    }
}
