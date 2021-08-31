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
   private weak var view: FilterInput?
   private weak var searchView: SearchInput?
   private var interactor: FilterInteractor?
   private var router: FilterRouter?
    
   private var filterType: String?

    
    
    
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
        self.view?.updateView(filterType:filterType ?? "low-sugar")
    }
    
   
    
       func viewDidLoad() {
        view?.initFilterArray()
        view?.setup()
       }
}

