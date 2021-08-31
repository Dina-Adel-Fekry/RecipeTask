//
//  DependencyFactory.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/31/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class DependencyFactory{
    static let sharedDependencyFactory = DependencyFactory()
    func presenterForSearch(_ view: SearchInput) -> SearchPresenter{
        return SearchPresenter(view: view, interactor: SearchInteractor(), router: SearchRouter())

    }
    func presenterForDetails(_ view: DetailsInput) -> DetailsPresenter{
        return DetailsPresenter(view: view, interactor: DetailsInteractor(), router: DetailsRouter())

    }
    func presenterForFilter(_ view: FilterInput) -> FilterPresenter{
        return FilterPresenter(view: view, interactor: FilterInteractor(), router: FilterRouter())

    }
    func presenterForSuggestions(_ view: SuggestionInput) -> SuggestionsPresenter{
        return SuggestionsPresenter(view: view, interactor: SuggestionsInteractor(), router: SuggestionsRouter())

    }
    
}
