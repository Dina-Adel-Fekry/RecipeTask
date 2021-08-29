//
//  DetailsViewController.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/28/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    
    @IBAction func recipeWebsiteAction(_ sender: Any) {
    }
    
    @IBAction func shareRecipeAction(_ sender: Any) {
        
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
       // self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
