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
    
    // MARK: -Private Methods
    private func fetchRecipeData(searchBarInput: String){
        
        interactor?.fetchRecipeData(completionHandler: { (value) in
        //    print((value as? SearchApiModel)?.hits)
            
            if let response = value as? SearchApiModel {
                let recipesViewModel = RecipesViewModel(searchApiModel: response)
          
                self.view?.initRecipeArray(recipesArray: recipesViewModel.recipes)
                if(recipesViewModel.recipes.isEmpty){
                    self.view?.showError()
                }
                else{
                self.view?.updateView()
                
                
                }
                self.view?.reloadData()
            }
            else{
                self.view?.showError()
                self.view?.reloadData()
            }
            

        }, searchBarInput: searchBarInput)
    }
    
    struct Recipe {
        let title: String?
        let image: String?
        let source: String?
        let healthLabels: [String]?
    }


}

extension SearchPresenter : SearchOutput{
    func didTapSearchBar(searchBarInput: String) {
        fetchRecipeData(searchBarInput: searchBarInput)
    }

       
       func viewDidLoad() {
       // view?.initRecipeArray(recipesArray: <#[RecipeModel]#>)
        view?.setup()
       }
}



