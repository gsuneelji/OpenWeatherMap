//
//  Date.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
extension Date {
    
    // Create a date string with time in correct timezone.
    //
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
