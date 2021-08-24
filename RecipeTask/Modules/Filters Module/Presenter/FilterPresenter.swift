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
    var interactor: FilterInteractor?
    var router: FilterRouter?
    
    
    
    // MARK: - Methods
    init(view : FilterInput,interactor: FilterInteractor,router:FilterRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
 
    


}

extension FilterPresenter : FilterOutput{
    func didTapFilterHealth() {
        
    }
    
       func viewDidLoad() {
        view?.initFilterArray()
        view?.setup()
       }
}

