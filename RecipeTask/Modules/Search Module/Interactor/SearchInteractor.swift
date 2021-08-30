//
//  SearchInteractor.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class SearchInteractor {
    

    var network = NetworkManager()
    func fetchRecipeData(body:[String: String?],completionHandler: @escaping (Any?)-> Void){
        
        network.fetchData(body:body,completionHandler: completionHandler)
    }
    func fetchMoreRecipeData(request: String,completionHandler: @escaping (Any?)-> Void){
        
        network.fetchMoreData(request:request,completionHandler: completionHandler)
    }
}


