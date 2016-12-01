//
//  RecipeCell.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/26/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var view_recipeName: UILabel!
    @IBOutlet weak var view_recipeIngredients: UILabel!

    func configureCell(recipeName: String, recipeIngredients: String){
        view_recipeName.text = recipeName
        view_recipeIngredients.text = recipeIngredients
    }

}
