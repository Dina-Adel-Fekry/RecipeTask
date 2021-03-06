//
//  FilterProtocols.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//

import Foundation
import UIKit

protocol FilterInput: class {
    func updateView(filterType: String)
    func initFilterArray()
    func setup()
}


protocol FilterOutput: class {
    func didTapFilterHealth(cellNumber: Int)
    func viewDidLoad()
    
}
