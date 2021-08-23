//
//  RecipeTableViewCell.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/22/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeSource: UILabel!
    
    @IBOutlet weak var recipeHelthLabels: UILabel!
    
    func setupCell(title : String ,source : String, health : String){
        recipeTitle?.text = title
        recipeSource?.text = source
        recipeHelthLabels?.text = health
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
