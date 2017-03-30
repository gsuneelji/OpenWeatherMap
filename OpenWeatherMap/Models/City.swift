//
//  City.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import ObjectMapper

// City object configured for ObjectMapper
//
class City: Mappable {
    
    var cityWeather: [CityWeather]?
    var cityMain: CityMain?
    var citySys: CitySys?
    var name: String?
    var responseCode: Int?
    var message: String?
    
    required init?(map: Map) {
        // needed for objectmapper mappable object
        //
    }
    
    // Configure mappings between model objects and
    // the json we will be receiving
    //
    func mapping(map: Map) {
        name <- map["name"]
        responseCode <- map["cod"]
        message <- map["message"]
        cityWeather <- map["weather"]
        cityMain <- map["main"]
        citySys <- map["sys"]
    }
}
