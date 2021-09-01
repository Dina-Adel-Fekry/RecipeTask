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
        case FilterCellIndex.ALL.rawValue:
            filterType = FilterName.ALL.rawValue
            
        case FilterCellIndex.LOW_SUGAR.rawValue:
            filterType = FilterName.LOW_SUGAR.rawValue
            
        case FilterCellIndex.KETO.rawValue:
            filterType = FilterName.KETO.rawValue
            
        case FilterCellIndex.VEGAN.rawValue:
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

