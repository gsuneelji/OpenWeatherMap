//
//  UIViewControllerUtility.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
extension UIViewController {
    
    // Utility method to dismiss keyboard after input entry
    //
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Utility method to display alerts
    //
    func presentAlertWithTitle(_ title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.Strings.ok, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
