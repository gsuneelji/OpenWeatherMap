//
//  WeatherImageTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherImageTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    func setupCell(cityWeather: CityWeather) {
        weatherConditionLabel.text = cityWeather.description?.uppercased()
        if let weatherIcon = cityWeather.icon, let imageUrl = NSURL(string: String(format:Constants.ConnectionPaths.cityWeatherImageURL, weatherIcon)) {
            weatherImageView.sd_setImage(with: imageUrl as URL)
        }
    }
}
