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
            filterType = FilterName.ALL.rawValue
            
        case 1:
            filterType = FilterName.LOW_SUGAR.rawValue
            
        case 2:
            filterType = FilterName.KETO.rawValue
            
        case 3:
            filterType = FilterName.VEGAN.rawValue
        default:
            print(AppText.NOT_AVAILABLE.rawValue)
        }
        self.view?.updateView(filterType:filterType ?? "")
    }
    
    
    
    func viewDidLoad() {
        view?.initFilterArray()
        view?.setup()
    }
}

