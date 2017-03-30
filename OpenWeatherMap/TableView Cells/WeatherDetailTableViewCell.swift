//
//  WeatherDetailTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var weatherValueLabel: UILabel!
    
    func setupCell(descriptionText: String, descriptionValue: String) {
        weatherDescriptionLabel.text = descriptionText.uppercased()
        weatherValueLabel.text = descriptionValue
    }
}
