//
//  FilterPresenter.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class FilterPresenter {
    
    
    
    // MARK: - Properties
    weak var view: FilterInput?
    weak var searchView: SearchInput?
    var interactor: FilterInteractor?
    var router: FilterRouter?
    
    var filterType: String?
    var searchInputText: String?
    
    
    
    // MARK: - Methods
    init(view : FilterInput,interactor: FilterInteractor,router:FilterRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension FilterPresenter : FilterOutput{
   
    
    func didTapFilterHealth(cellNumber: Int) {
        switch cellNumber {
        case 0:
            filterType = "all"

        case 1:
            filterType = "low-sugar"

        case 2:
            filterType = "keto-friendly"

        case 3:
            filterType = "vegan"
        default:
            print("Not Available")
        }
        //presenter -> view of filter -> set search
        self.view?.updateView(filterType:filterType ?? "low-sugar")
//        interactor?.fetchRecipeDataFiltered(completionHandler: { (value) in
//            if let response = value as? SearchApiModel {
//                  let recipesViewModel = RecipesViewModel(searchApiModel: response)
//
//
//
//                  self.searchView?.initRecipeArray(recipesArray: recipesViewModel.recipes)
//                  if(recipesViewModel.recipes.isEmpty){
//                      self.searchView?.showError()
//                  }
//                  else{
//                  self.searchView?.updateView()
//
//
//                  }
//                  self.searchView?.reloadData()
//              }
//              else{
//                  self.searchView?.showError()
//                  self.searchView?.reloadData()
//              }
//
//
//        }, filterType: filterType ?? "low-sugar",searchBarInput: searchInputText!)
    }
    
   
    
       func viewDidLoad() {
        view?.initFilterArray()
        view?.setup()
       }
}

