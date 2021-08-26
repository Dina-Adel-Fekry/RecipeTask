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
    func fetchRecipeData(completionHandler: @escaping (Any?)-> Void,searchBarInput: String){
        
        network.fetchData(completionHandler: completionHandler, searchBarInput: searchBarInput)
    }
    
   
}


