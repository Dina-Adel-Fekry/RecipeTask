//
//  SearchApiModel.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation

struct SearchApiModel: Decodable {
    var _links: LinksData
    var hits: [HitsData]    
}

struct LinksData: Decodable{
    var next: NextData
}

struct NextData: Decodable {
    var href: String
}

struct HitsData: Decodable {
    var recipe: RecipeData
}

struct RecipeData: Decodable{
    var label: String
    var source: String
    var image: String
    var healthLabels: [String]
}
