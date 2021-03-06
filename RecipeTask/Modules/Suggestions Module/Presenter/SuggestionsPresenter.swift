//
//  SuggestionsPresenter.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class SuggestionsPresenter {
    
    // MARK: - Properties
    private weak var view: SuggestionInput?
    private var interactor: SuggestionsInteractor?
    private var router: SuggestionsRouter?
    
    // MARK: - Methods
    init(view : SuggestionInput,interactor: SuggestionsInteractor,router:SuggestionsRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
extension SuggestionsPresenter : SuggestionOutput{
    
    
    func disSetCurrentSuggestion(suggestion: String) {
        view?.initSuggestionsArray(suggestion:suggestion)
        view?.reloadData()
    }
    
    
    func didTapSuggestionItem(suggestion: String) {
        view?.updateView(suggestion:suggestion)
    }
    
    func viewDidLoad() {
        view?.setup()
        
    }
    
    
    
}
