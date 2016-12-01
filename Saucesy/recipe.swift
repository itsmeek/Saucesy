//
//  recipe.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/24/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import Foundation
import Alamofire

class model_Recipe {
    
    struct structure_recipe {
        let name: String!
        let ingredients: Array<String>!
    }
    
    typealias jsonStandard = Dictionary<String,AnyObject>
    
    var model_recipe: Array = [structure_recipe]()
    
//    private var _model_recipeName: String!
//
//    var model_recipeName: String {
//        if _model_recipeName == nil{
//            _model_recipeName = ""
//        }
//        return _model_recipeName
//    }
    
    func downloadRecipe(completed: @escaping DownloadComplete){
        
        //Telling Alamofire where to download from
        let recipeURL = URL(string: RECIPE_URL)!
        
        Alamofire.request(recipeURL).responseJSON { response in
            
            if let dict = response.result.value as? jsonStandard {
                
                if let hits = dict["hits"] as? [jsonStandard]{
                    
                    for x in 0..<hits.count{
                        if let recipe = hits[x]["recipe"] as? jsonStandard{
                            let label = recipe["label"] as? String
                            let ingredientLines = recipe["ingredientLines"] as? [String]
                            self.model_recipe.append(structure_recipe.init(name: label, ingredients: ingredientLines))
                        }
                    }
                    
                }
            }
            completed()
        }
    }
}
