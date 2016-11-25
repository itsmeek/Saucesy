//
//  RecipeCell.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/24/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeCalories: UILabel!
    @IBOutlet weak var recipeServings: UILabel!
    
    var singleRecipe: Recipe!
    
    func configureCell(singleRecipe: Recipe){
        
        self.singleRecipe = singleRecipe
        
        recipeName.text = self.singleRecipe.name
        
    }
    
}
