//
//  recipe.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/24/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import Foundation

class Recipe {
    
    private var _name: String!
    
    var name: String{
        return _name
    }
    
    init(name: String) {
        self._name = name
    }
}
