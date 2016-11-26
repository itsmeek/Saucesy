//
//  keys.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/25/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import Foundation

func app_id(named keyname:String) -> String {
    let filePath = Bundle.main.path(forResource: "keys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    let value = plist?.object(forKey: "app_id") as! String
    return value
}

func app_key(named keyname:String) -> String {
    let filePath = Bundle.main.path(forResource: "keys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile: filePath!)
    let value = plist?.object(forKey: "app_key") as! String
    return value
}

