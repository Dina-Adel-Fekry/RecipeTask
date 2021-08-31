//
//  SearchRouter.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter {
    
    func showDetails(recipe:RecipeModel){
        if let searchViewController = UIApplication.topViewController() as? SearchViewController{
            let storyBoard : UIStoryboard = UIStoryboard(name:Identifiers.DETAILS_STORY_BOARD.rawValue, bundle:nil)
            guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: Identifiers.DETAILS_VIEW_CONTROLLER.rawValue) as? DetailsViewController else{
                return
            }
            detailsViewController.setRecipeData(recipe: recipe)
            
            searchViewController.navigationController?.pushViewController(detailsViewController, animated: true)
            
        }
   
    }
    
}
