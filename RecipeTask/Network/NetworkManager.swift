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
   // var searchBarText: String?
    
    func fetchData(body:[String:String?],completionHandler: @escaping (Any?)-> Void){
                
            var request = "https://api.edamam.com/api/recipes/v2?&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public"
        
        for param in body{
            if let value = param.value{
                request.append("&\(param.key)=\(value)")
            }
        }
        AF.request(request).validate().responseDecodable(of: SearchApiModel.self) { (response) in
                
                completionHandler(response.value)



            
            
//       // print(value._links.next.href)
//      //  print(value.hits[5].recipe.label)
//
//                }
       }

    }
    
    func fetchMoreData(request: String,completionHandler: @escaping (Any?)-> Void){
        AF.request(request).validate().responseDecodable(of: SearchApiModel.self) { (response) in
                        
                        completionHandler(response.value)
               
               }
    }
    

    }


