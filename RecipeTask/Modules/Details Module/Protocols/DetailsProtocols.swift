//
//  DetailsProtocols.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/29/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsInput: class {
    func setup()
    func showRecipeWebsitePage()
    
}


protocol DetailsOutput: class {
    
    func viewDidLoad()
    func didDataReceived()
    func didTapWebsiteButton()
}
