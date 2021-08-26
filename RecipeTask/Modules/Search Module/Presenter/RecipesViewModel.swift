//
//  RecipesViewModel.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/25/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class RecipesViewModel{
    var recipes = [RecipeModel]()
    var nextPageUrl: String?
    init( searchApiModel: SearchApiModel){
        self.nextPageUrl = searchApiModel._links.next.href
        for hit in searchApiModel.hits{
            let recipeModel = RecipeModel(hitsData: hit)
            recipes.append(recipeModel)
        }
    }
}


class RecipeModel{
    var title: String?
    var image: String?
    var source: String?
    var healthLabels: [String]?
    init(hitsData: HitsData) {
        self.title = hitsData.recipe.label
        self.image = hitsData.recipe.image
        self.source = hitsData.recipe.source
        self.healthLabels = hitsData.recipe.healthLabels
    }
}
