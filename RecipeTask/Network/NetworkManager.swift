//
//  NetworkManager.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func fetchData(){
        Alamofire.request("https://api.edamam.com/api/recipes/v2?q=chicken&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public").responseJSON { (response) in
             print("Response value \(response)")  
             print("Response.result.value \(response.result.value!)")
    }
    }
}
