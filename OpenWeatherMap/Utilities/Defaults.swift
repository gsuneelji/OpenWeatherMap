//
//  Defaults.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import Foundation

private let userDefaults = UserDefaults.standard

struct Defaults {

    private static let citySearchedKey = "CitySearched"
    
    // String that keeps track of the last entered city name
    //
    static var citySearched: String {
        get {
            return userDefaults.string(forKey: citySearchedKey) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: citySearchedKey)
        }
    }

    // Reset user defaults
    //
    static func resetUserDefaults() {
        citySearched = ""
    }
}
