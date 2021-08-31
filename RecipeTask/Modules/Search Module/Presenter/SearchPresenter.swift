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
   private weak var view: SearchInput?
   private var interactor: SearchInteractor?
   private var router: SearchRouter?
    
    
    
    
    // MARK: - Methods
    init(view : SearchInput,interactor: SearchInteractor,router:SearchRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: -Private Methods
    private func fetchRecipeData(searchBarInput: String){
        var body = [String: String?]()
        body["q"] = searchBarInput
        interactor?.fetchRecipeData(body:body,completionHandler: { (value) in
        //    print((value as? SearchApiModel)?.hits)
            if let response = value as? SearchApiModel {
                self.fetchRecipeDataSucceeded(response: response)
            }
            else{
                self.fetchRecipeDataFailed()
            }
        })
    }
    

    private func fetchRecipeDataSucceeded(response: SearchApiModel){
         self.getFullResponse(response: response)
        
    }
    private func fetchRecipeDataFailed(){
         self.view?.showError()
         self.view?.reloadData()
    }
    
    private func fetchFilteredData(searchBarInput: String,filterType: String){
          var body = [String: String?]()
          body["q"] = searchBarInput
          body["health"] = filterType
          interactor?.fetchRecipeData(body:body,completionHandler: { (value) in
              if let response = value as? SearchApiModel {
                self.fetchFilteredDataSucceeded(response: response)
              }
              else{
                self.fetchFilteredDataFailed()
              }

          })
      }
    
    private func fetchFilteredDataSucceeded(response: SearchApiModel){
         self.getFullResponse(response: response)
        
    }
    private func fetchFilteredDataFailed(){
         self.view?.showError()
         self.view?.reloadData()
    }
      
      private func fetchMoreData(request: String){
          interactor?.fetchMoreRecipeData(request:request,completionHandler: { (value) in
              if let response = value as? SearchApiModel {
                  self.fetchMoreDataSucceeded(response: response)
              }
              else{
                self.fetchMoreDataFailed()
              }

          })
      }
    
    private func fetchMoreDataSucceeded(response: SearchApiModel){
            self.getFullResponse(response: response)
           
       }
       private func fetchMoreDataFailed(){
            self.view?.showError()
            self.view?.reloadData()
       }
    
    private func getFullResponse(response: SearchApiModel){
        let recipesViewModel = RecipesViewModel(searchApiModel: response)
        self.view?.initRecipeArray(recipesArray: recipesViewModel.recipes, from: recipesViewModel.from ?? 1, count: recipesViewModel.count ?? 20,nextUrl: recipesViewModel.nextPageUrl ?? "")
        if(recipesViewModel.recipes.isEmpty){
            getFullResponseFailed()
        }
        else{
             getFullResponseSucceeded()
        }
        
        
    }
    
    private func getFullResponseSucceeded(){
         self.view?.updateView()
        self.view?.reloadData()
        
    }
    private func getFullResponseFailed(){
         self.view?.showError()
         self.view?.reloadData()
    }
    
    
}

extension SearchPresenter : SearchOutput{
    func didTapSearchBar(searchBarInput: String) {
        fetchRecipeData(searchBarInput: searchBarInput)
        view?.setSuggestions(suggestion: searchBarInput)
    }

       func viewDidLoad() {
        view?.setup()
        view?.setHiddenViews()
       }
    
    func didTapFilterCell(searchBarInput: String, filterType: String){
        fetchFilteredData(searchBarInput: searchBarInput, filterType: filterType)
    }

    func didNeedMoreData(request:String){
        fetchMoreData(request:request)
    }
    func navigateToDetails(recipe: RecipeModel) {
        router?.showDetails(recipe: recipe)
    }
    func didChooseSuggestion(suggestion: String){
        view?.setSearchBarText(suggestion: suggestion)
    }
    
}



