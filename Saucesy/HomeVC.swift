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
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        controller_recipe.downloadRecipe {
            self.collection.reloadData()
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCell {
            
            cell.configureCell(recipeName: controller_recipe.model_recipeNames[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return controller_recipe.model_recipeNames.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: CGFloat(362))
    }
}

