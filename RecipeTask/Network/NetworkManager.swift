//
//  NetworkManager.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//encoding: .JSON)
import Foundation
import Alamofire

class NetworkManager {
    
    func fetchData(completionHandler: @escaping (Any)-> Void){
               AF.request("https://api.edamam.com/api/recipes/v2?q=chicken&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public").validate().responseDecodable(of: SearchApiModel.self) { (response) in
       if let value = response.value {
        completionHandler(value)
        print(value._links.next.href)
        print(value.hits[5].recipe.label)
        
                }
       }

    }
    }

