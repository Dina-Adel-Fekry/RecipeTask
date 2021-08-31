//
//  DetailsPresenter.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
class DetailsPresenter {
    
   private weak var view: DetailsInput?
   private var interactor: DetailsInteractor?
   private var router: DetailsRouter?

    // MARK: - Methods
    init(view : DetailsInput,interactor: DetailsInteractor,router:DetailsRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}
extension DetailsPresenter : DetailsOutput{
    func didTapWebsiteButton() {
        view?.showRecipeWebsitePage()
    }
    
    func viewDidLoad() {
        view?.setup()
        
    }
    func didDataReceived(){
        view?.setup()
        
    }
    
    
}
