//
//  Constants.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/25/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import Foundation

// Closure: This is going to tell the function when its finished downloading
typealias DownloadComplete = () -> ()

let URL_BASE = "https://api.edamam.com/search?"
let APP_ID = "_app_id="
let APP_ID_VALUE = app_id(named: "api_id")
let APP_KEY = "&app_key="
let APP_KEY_VALUE = app_key(named: "api_key")
let SEARCH_QUERY = "&q="
let SEARCH_QUERY_VALUE = "rice"

let RECIPE_URL = "\(URL_BASE)\(APP_ID)\(APP_ID_VALUE)\(APP_KEY)\(APP_KEY_VALUE)\(SEARCH_QUERY)\(SEARCH_QUERY_VALUE)"
