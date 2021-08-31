//
//  RecipeTableViewCell.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/22/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeSource: UILabel!
    
    @IBOutlet weak var recipeHelthLabels: UILabel!
    
    func setupCell(title : String? ,image:String?,source : String?, health : [String]?){
        recipeTitle.text = title
        recipeSource.text = source
        recipeImage.image = UIImage(named: (image ?? ""))
        recipeImage.sd_setImage(with: URL(string: image ?? ""))
        recipeHelthLabels.text = health?.joined(separator: ",")
            
    }
    
}
