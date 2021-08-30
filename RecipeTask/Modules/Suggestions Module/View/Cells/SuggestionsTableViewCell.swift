//
//  SuggestionsTableViewCell.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var suggetionLabel: UILabel!
    func setupCell(suggestion : String ){
        suggetionLabel?.text = suggestion
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
