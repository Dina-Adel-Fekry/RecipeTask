//
//  SearchInteractor.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class SearchInteractor {
    func fetchRecipeData(body:[String: String?],completionHandler: @escaping (Any?)-> Void){
        let specs = RequestSpecs(url:AppUrls.BASE_URL.rawValue , parameters: body)
        NetworkManager.sharedNetworkManager.fetch(requestSpecs: specs, completionHandler: completionHandler)
    }
    func fetchMoreRecipeData(request: String,completionHandler: @escaping (Any?)-> Void){
        
        // network.fetch(request:request,completionHandler: completionHandler)
        let specs = RequestSpecs(url: request)
        NetworkManager.sharedNetworkManager.fetch(requestSpecs: specs, completionHandler: completionHandler)
    }
}



