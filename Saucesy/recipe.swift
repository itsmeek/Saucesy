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
    
    class class_recipe {
        
        private var _name: String!
        private var _ingredients: Array<String>!
        private var _calories: Int!
        private var _servings: Int!

        var name: String{
            if _name == nil{
                _name = ""
            }
            return _name
        }
        
        var ingredients: Array<String>{
            if _ingredients == nil{
                _ingredients = [""]
            }
            return _ingredients
        }
        
        var calories: Int{
            if _calories == nil{
                _calories = 0
            }
            return _calories
        }
        
        var servings: Int{
            if _servings == nil{
                _servings = 0
            }
            return _servings
        }
        
        init(name: String, ingredients: Array<String>, calories: Int, servings: Int) {
            self._name = name
            self._ingredients = ingredients
            self._calories = calories
            self._servings = servings
        }
    }
    
    typealias jsonStandard = Dictionary<String,AnyObject>
    
    var model_recipe_array: Array = [class_recipe]()
    
    
    func downloadRecipe(completed: @escaping DownloadComplete){
        
        //Telling Alamofire where to download from
        let recipeURL = URL(string: RECIPE_URL)!
        
        Alamofire.request(recipeURL).responseJSON { response in
            
            if let dict = response.result.value as? jsonStandard {
                
                if let hits = dict["hits"] as? [jsonStandard]{
                    
                    for x in 0..<hits.count{
                        if let recipe = hits[x]["recipe"] as? jsonStandard{
                            let name = recipe["label"] as? String
                            let ingredients = recipe["ingredientLines"] as? [String]
                            let calories = recipe["calories"] as? Int
                            let servings = recipe["yield"] as? Int
                            
                            let class_recipe_instance = class_recipe.init(name: name!, ingredients: ingredients!, calories: calories!, servings: servings!)
                            self.model_recipe_array.append(class_recipe_instance)
                        }
                    }
                }
            }
            completed()
        }
    }
}
