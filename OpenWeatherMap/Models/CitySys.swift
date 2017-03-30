//
//  CitySys.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import ObjectMapper

// CitySys object configured for ObjectMapper
//
class CitySys: Mappable {
    
    var sunrise: Double?
    var sunset: Double?
    
    required init?(map: Map) {
        // needed for objectmapper mappable object
        //
    }
    
    // Configure mappings between model objects and
    // the json we will be receiving
    //
    func mapping(map: Map) {
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
