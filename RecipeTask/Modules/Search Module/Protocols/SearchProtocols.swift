//
//  SearchProtocols.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import UIKit

protocol SearchInput: class {
    func reloadData()
    func showError()
    func updateView()
    func showSuggestions()
    func initRecipeArray(recipesArray:[RecipeModel])
    func setup()
}


protocol SearchOutput: class {
   // func didTapSearchBar()
    func didTapSearchBar(searchBarInput: String)
    func didTapFilterCell(searchBarInput: String, filterType: String)
    func viewDidLoad()
    
}
