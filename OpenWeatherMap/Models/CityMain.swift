//
//  CityMain.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import ObjectMapper

// CityMain object configured for ObjectMapper
//
class CityMain: Mappable {
    
    var temperature: Double?
    var humidity: Int?
    
    required init?(map: Map) {
        // needed for objectmapper mappable object
        //
    }
    
    // Configure mappings between model objects and
    // the json we will be receiving
    //
    func mapping(map: Map) {
        temperature <- map["temp"]
        humidity <- map["humidity"]
    }
}
