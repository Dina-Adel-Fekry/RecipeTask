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

            //    self.searchBarText = searchBarInput
//       if let value = response.value {
//        completionHandler(value)
//       // print(value._links.next.href)
//      //  print(value.hits[5].recipe.label)
//
//                }
       }
      // searchBarText = searchBarInput
    }
    
//    func fetchDataFiltered(completionHandler: @escaping (Any?)-> Void, filterType: String,searchBarInput: String){
//        
//        if (filterType=="all"){
//            AF.request("https://api.edamam.com/api/recipes/v2?q=\(String(describing: self.searchBarText))&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public").validate().responseDecodable(of: SearchApiModel.self) { (response) in
//                            
//                            completionHandler(response.value)
//
//                       
//                   }
//            
//        }
//        
//        else{ AF.request("https://api.edamam.com/api/recipes/v2?q=\(String(describing: self.searchBarInput))&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&health=\(filterType)&type=public").validate().responseDecodable(of: SearchApiModel.self) { (response) in
//                        
//                        completionHandler(response.value)
//
//            }
//        }
//        
//    }
    
    }


