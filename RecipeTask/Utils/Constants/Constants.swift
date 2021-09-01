//
//  Constants.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/31/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation

enum AppUrls: String{
    case BASE_URL = "https://api.edamam.com/api/recipes/v2?&app_id=8b456bdf&app_key=473b2f968e4aa88550ee5b5a07e6cfac&type=public"
}
enum NibName: String{
    case SUGGESTIONS_TABLE_VIEW_CELL = "SuggestionsTableViewCell"
    case FILTER_COLLECTION_VIEW_CELL = "FilterCollectionViewCell"
    case RECIPE_TABLE_VIEW_CELL = "RecipeTableViewCell"
    
}
enum Identifiers: String{
    case SUGGESTION_CELL = "SuggestionCell"
    case FILTER_COLLECTION_VIEW_CELL = "FilterCollectionViewCell"
    case DETAILS_STORY_BOARD = "DetailsStoryboard"
    case DETAILS_VIEW_CONTROLLER = "DetailsViewController"
    case RECIPE_CELL = "RecipeCell"
}
enum AppText: String{
    case SEPARATOR = "\u{0085}"
    case ENGLISH_LETTERS_ONLY_REGEX = ".*[^A-Za-z \n].*"
    case ERROR_MSG = "Error in Using Search Bar"
    case NOT_AVAILABLE = "Not Available"
}
enum Dimension:Float {
    case COLLECTION_VIEW_WIDTH = 120.0
    case COLLECTION_VIEW_HEIGHT = 60.0
    case TABLE_VIEW_HEIGHT = 200.0
}
enum Key: String{
    case  SAVED_STRING_ARRAY = "SavedStringArray"
}
enum ImageName: String{
    case SHARE = "share"
}
enum FilterTypes: String{
    case ALL = "All"
    case LOW_SUGAR = "Low Sugar"
    case VEGAN = "Vegan"
    case KETO = "Keto"
}
enum FilterName: String{
    case ALL = "all"
    case LOW_SUGAR = "low-sugar"
    case VEGAN = "vegan"
    case KETO = "keto-friendly"
    
}
enum FilterCellIndex: Int{
    case ALL = 0
    case LOW_SUGAR = 1
    case KETO = 2
    case VEGAN = 3
}

