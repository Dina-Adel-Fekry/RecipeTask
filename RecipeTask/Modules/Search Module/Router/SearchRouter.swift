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
  
    func transferData(recipe:RecipeModel){
//        let storyBoard : UIStoryboard = UIStoryboard(name: "SearchStoryBoard", bundle:nil)
//        let searchViewController = storyBoard.instantiateInitialViewController(withIdentifier: "SearchViewController")
        if let searchViewController = UIApplication.topViewController() as? SearchViewController{
            let storyBoard : UIStoryboard = UIStoryboard(name: "DetailsStoryboard", bundle:nil)
            guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else{
                return
            }
            detailsViewController.setRecipeData(recipe: recipe)
            
            searchViewController.navigationController?.pushViewController(detailsViewController, animated: true)
            
        }
        
       
        
    
    }
    
}
