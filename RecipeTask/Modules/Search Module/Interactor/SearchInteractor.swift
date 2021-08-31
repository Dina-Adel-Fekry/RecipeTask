//
//  SearchInteractor.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class SearchInteractor {
    

  //  var network = NetworkManager()
    func fetchRecipeData(body:[String: String?],completionHandler: @escaping (Any?)-> Void){
        
      //  network.fetch(body:body,completionHandler: completionHandler)
        let specs = RequestSpecs(url:"https://api.edamam.com/api/recipes/v2?&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public" , parameters: body)
        NetworkManager.sharedNetworkManager.fetch(requestSpecs: specs, completionHandler: completionHandler)
    }
    func fetchMoreRecipeData(request: String,completionHandler: @escaping (Any?)-> Void){
        
       // network.fetch(request:request,completionHandler: completionHandler)
        let specs = RequestSpecs(url: request)
        NetworkManager.sharedNetworkManager.fetch(requestSpecs: specs, completionHandler: completionHandler)
    }
}



