//
//  CityWeather.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import ObjectMapper

// CityWeather object configured for ObjectMapper
//
class CityWeather: Mappable {
    
    var description: String?
    var icon: String?
    
    required init?(map: Map) {
        // needed for objectmapper mappable object
        //
    }
    
    // Configure mappings between model objects and
    // the json we will be receiving
    //
    func mapping(map: Map) {
        description <- map["description"]
        icon <- map["icon"]
    }
}
