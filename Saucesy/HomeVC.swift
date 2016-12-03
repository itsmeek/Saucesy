//
//  HomeVC.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/24/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!

    
    var controller_recipe = model_Recipe()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Changes the title text "Saucesy" to logo
        let logo = UIImage(named: "logo.png")
        navigationItem.titleView = UIImageView(image: logo)
        
        collection.dataSource = self
        collection.delegate = self
        
        //Prevents extra spacing on the bottom of the last table view cell
        self.automaticallyAdjustsScrollViewInsets = false
        
        controller_recipe.downloadRecipe {
            self.collection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell {
            
            let indexRow = controller_recipe.model_recipe_array[indexPath.row]
            let recipe = indexRow.name
            let ingredients_array = indexRow.ingredients
            let ingredients = ingredients_array.joined(separator: ". ")
            let servings = indexRow.servings
            let calories = indexRow.calories
            
            cell.configureCell(recipeName: recipe, recipeIngredients: ingredients, recipeServings: servings, recipeCalories: calories)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "HomeDetailVC", sender: controller_recipe)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return controller_recipe.model_recipe_array.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: CGFloat(362))
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "HomeDetailVC" {
//            if let detailVC = segue.destination as? HomeDetailVC{
////                detailVC.hidesBottomBarWhenPushed = true
////                detailVC.navigationController?.isNavigationBarHidden = true
//                if let recipe_items = sender as? model_Recipe{
//                    detailVC.detail_recipe = recipe_items
//                }
//            }
//        }
//    }
}

