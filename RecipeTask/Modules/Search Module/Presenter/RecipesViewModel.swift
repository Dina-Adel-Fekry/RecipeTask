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
    var from: Int?
    var to: Int?
    var count: Int?
    init( searchApiModel: SearchApiModel){
        self.nextPageUrl = searchApiModel._links.next.href
        self.from = searchApiModel.from
        self.to = searchApiModel.to
        self.count = searchApiModel.count
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
    var url: String?
    var shareAs: String?
    var ingredientLines: [String]?
    init(hitsData: HitsData) {
        self.title = hitsData.recipe.label
        self.image = hitsData.recipe.image
        self.source = hitsData.recipe.source
        self.healthLabels = hitsData.recipe.healthLabels
        self.url = hitsData.recipe.url
        self.shareAs = hitsData.recipe.shareAs
        self.ingredientLines = hitsData.recipe.ingredientLines
    }
}
