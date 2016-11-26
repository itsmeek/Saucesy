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
    
    private var _model_recipeName: String!
    
    var model_recipeName: String {
        if _model_recipeName == nil{
            _model_recipeName = ""
        }
        return _model_recipeName
    }
    
    func downloadRecipe(completed: @escaping DownloadComplete){
        
        //Telling Alamofire where to download from
        let recipeURL = URL(string: RECIPE_URL)!
        
        Alamofire.request(recipeURL).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String,AnyObject> {
                
                if let hits = dict["hits"] as? [Dictionary<String,AnyObject>]{
                    
                    for x in 0..<hits.count{
                        if let recipe = hits[x]["recipe"] as? Dictionary<String, AnyObject>{
                            if let label = recipe["label"] as? String{
                                self._model_recipeName = label
                                print(self.model_recipeName)
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
}
