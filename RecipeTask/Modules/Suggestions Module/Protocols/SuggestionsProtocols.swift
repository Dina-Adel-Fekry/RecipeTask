//
//  SuggestionsProtocols.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import UIKit

protocol SuggestionInput: class {
    func initSuggestionsArray(suggestion: String)
    func setup()
    func updateView(suggestion: String)
}


protocol SuggestionOutput: class {
    func didTapSuggestionItem(suggestion: String)
    func viewDidLoad()
    func viewSuggestion(suggestion: String)
    
}
