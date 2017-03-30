//
//  Constants.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit

struct Constants {
    struct CellIdentifiers {
        static let weatherDetailTableViewCellId = "weatherDetailTableViewCellId"
        static let weatherImageTableViewCellId = "weatherImageTableViewCellId"
    }
    
    struct TableViewCells {
        static let weatherDetailTableViewCell = "WeatherDetailTableViewCell"
        static let weatherImageTableViewCell = "WeatherImageTableViewCell"
    }
    
    struct ConnectionPaths {
        static let cityWeatherURL = "http://api.openweathermap.org/data/2.5/weather?"
        static let cityWeatherImageURL = "http://openweathermap.org/img/w/%@.png"
        static let appID = "03b233ea0b5bd6c570d2bb5ffb5d7e3e"
    }
    
    struct CellHeight {
        static let weatherTableViewCellHeight: CGFloat = 80.0
    }
    
    struct Strings {
        static let error = "Error"
        static let ok = "Ok"
        static let enterCity = "Please input city name"
        static let noInfo = "Unable to get the weather information"
    }
    
    struct ResponseCodes {
        static let successCode = 200
    }
}
