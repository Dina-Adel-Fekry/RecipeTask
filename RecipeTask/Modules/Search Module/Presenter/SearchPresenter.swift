//
//  SearchPresenter.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class SearchPresenter {
    
    
    
    // MARK: - Properties
    weak var view: SearchInput?
    var interactor: SearchInteractor?
    var router: SearchRouter?
    
    
    // MARK: - Methods
    init(view : SearchInput,interactor: SearchInteractor,router:SearchRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
 
    


}

extension SearchPresenter : SearchOutput{
    func didTapSearchBar() {
           
       }
       
       func viewDidLoad() {
        view?.initRecipeArray()
        view?.setup()
       }
}

