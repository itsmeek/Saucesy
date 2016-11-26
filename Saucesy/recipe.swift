//
//  recipe.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/24/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import Foundation
import Alamofire

class Recipe {
    
    var _recipeName: String!
    
    var recipeName: String {
        if _recipeName == nil{
            _recipeName = ""
        }
        return _recipeName
    }
    
    func downloadRecipe(completed: @escaping DownloadComplete){
        
        //Telling Alamofire where to download from
        let recipeURL = URL(string: RECIPE_URL)!
        
        Alamofire.request(recipeURL).responseJSON { response in
            print("original URL request: \(response.request)")
            print("HTTP URL response: \(response.response)")
            print("server data: \(response.data)")     //
            print("result of response serialization: \(response.result)")   
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
            completed()
        }
    }
}
