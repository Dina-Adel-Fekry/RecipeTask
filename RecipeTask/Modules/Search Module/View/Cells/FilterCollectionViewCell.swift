//
//  FilterCollectionViewCell.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/23/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filterHealthLabel: UILabel!
 
    func setupCell(healthName : String){
        filterHealthLabel.text = healthName
    }

}
