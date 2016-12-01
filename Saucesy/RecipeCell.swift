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
    @IBOutlet weak var view_recipeIngredients: UITextView!
    @IBOutlet weak var view_recipeServings: UILabel!
    @IBOutlet weak var view_recipCalories: UILabel!

    func configureCell(recipeName: String, recipeIngredients: String, recipeServings: Int, recipeCalories: Int){
        view_recipeName.text = recipeName
        view_recipeIngredients.text = recipeIngredients
        view_recipeServings.text = "\(recipeServings)"
        view_recipCalories.text = "\(recipeCalories)"
    }

}
