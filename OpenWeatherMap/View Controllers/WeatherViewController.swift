//
//  WeatherViewController.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import UIKit
import SVProgressHUD

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var cityTextField: UITextField!
    
    var city: City?
    // Order to static cells to display the weather information
    //
    fileprivate let weatherDescriptionTypes: [WeatherDescriptionType] = [.city, .image, .temperature, .humidity, .sunrise, .sunset]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.isHidden = true
        setupTableView()
        
        // Get the weather details for the last city searched
        //
        if !Defaults.citySearched.isEmpty {
            SVProgressHUD.show()
            cityTextField.text = Defaults.citySearched
            GetWeatherDetailsService(handler: self).getWeatherDetailsForCity(cityName: Defaults.citySearched)
        }
    }
    
    // Setup weather tableview
    //
    func setupTableView() {
        weatherTableView.register(UINib(nibName: Constants.TableViewCells.weatherDetailTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.weatherDetailTableViewCellId)
        weatherTableView.register(UINib(nibName: Constants.TableViewCells.weatherImageTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.CellIdentifiers.weatherImageTableViewCellId)
    }
    
    // Action when SUBMIT button pressed
    //
    @IBAction func submitButtonPressed() {
        dismissKeyboard()
        guard let cityName = cityTextField.text, !cityName.isEmpty else {
            weatherTableView.isHidden = true
            presentAlertWithTitle(Constants.Strings.error, message: Constants.Strings.enterCity)
            return
        }
        
        SVProgressHUD.show()
        // Fetch city information from BE
        //
        GetWeatherDetailsService(handler: self).getWeatherDetailsForCity(cityName: cityName)
        Defaults.citySearched = cityName
    }
}

// MARK: - UITableViewDataSource
//
extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDescriptionTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherItem = weatherDescriptionTypes[indexPath.row]
        
        if weatherItem == .image {
            return loadWeatherImageTableViewCell(indexPath)
        } else {
            return loadWeatherDescriptionTableViewCell(indexPath)
        }
    }
    
    // Cell setup to display weather icon and description
    //
    private func loadWeatherImageTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.weatherImageTableViewCellId, for: indexPath) as! WeatherImageTableViewCell
        if let city = self.city, let cityWeather = city.cityWeather?.first {
            cell.setupCell(cityWeather: cityWeather)
        }
        return cell
    }
    
    // Cell setup to display temperature and remaining information
    //
    private func loadWeatherDescriptionTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.weatherDetailTableViewCellId, for: indexPath) as! WeatherDetailTableViewCell
        let weatherItem = weatherDescriptionTypes[indexPath.row]
        let descText = weatherItem.rawValue.uppercased()
        var descValue = ""
        
        switch weatherItem {
        case .city:
            if let city = self.city, let cityWeather = city.name {
                descValue = cityWeather.uppercased()
            }
        case .temperature:
            if let city = self.city, let cityWeather = city.cityMain?.temperature {
                descValue = "\(String(format:"%.1f" ,cityWeather/10))ºC"
            }
        case .humidity:
            if let city = self.city, let cityHumidity = city.cityMain?.humidity {
                descValue = "\(cityHumidity)%"
            }
        case .sunrise:
            if let city = self.city, let sunrise = city.citySys?.sunrise {
                descValue = Date(timeIntervalSince1970: sunrise).dateString
            }
        case .sunset:
            if let city = self.city, let sunset = city.citySys?.sunset {
                descValue = Date(timeIntervalSince1970: sunset).dateString
            }
        default:
            return UITableViewCell()
        }
        
        cell.setupCell(descriptionText: descText, descriptionValue: descValue)
        return cell
    }
}

// MARK: - UITableViewDelegate
//
extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.CellHeight.weatherTableViewCellHeight
    }
}

// MARK: - GetWeatherDetailsServiceHandler
//
extension WeatherViewController: GetWeatherDetailsServiceHandler {
    
    // Handle success
    //
    func handleSuccess(city: City) {
        SVProgressHUD.dismiss()
        if city.responseCode == Constants.ResponseCodes.successCode {
            self.city = city
            weatherTableView.isHidden = false
            weatherTableView.reloadData()
        } else {
            presentAlertWithTitle(Constants.Strings.error, message: city.message)
        }
        
    }
    
    // Handle failure
    //
    func handleFailure(errorMessage: String) {
        weatherTableView.isHidden = true
        SVProgressHUD.dismiss()
        presentAlertWithTitle(Constants.Strings.error, message: Constants.Strings.noInfo)
    }
}
