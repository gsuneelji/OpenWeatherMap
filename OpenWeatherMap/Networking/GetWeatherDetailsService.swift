//
//  GetWeatherDetailsService.swift
//  OpenWeatherMap
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

// Protocol must be implemented by any view controller
// which is using this protocol
//
protocol GetWeatherDetailsServiceHandler {
    func handleSuccess(city: City)
    func handleFailure(errorMessage: String)
}

class GetWeatherDetailsService: NSObject {
    
    var completionHandler: GetWeatherDetailsServiceHandler?
    
    init(handler: GetWeatherDetailsServiceHandler) {
        completionHandler = handler
    }
    
    func getWeatherDetailsForCity(cityName: String) {
        let params = ["q": cityName, "appid": Constants.ConnectionPaths.appID]
        Alamofire.request(Constants.ConnectionPaths.cityWeatherURL, method: .get, parameters: params, encoding: URLEncoding.queryString).responseObject { (response: DataResponse<City>) in
            
            if let result = response.result.value {
                self.completionHandler?.handleSuccess(city: result)
            } else {
                self.completionHandler?.handleFailure(errorMessage: response.error?.localizedDescription ?? "")
            }
        }
    }
}
