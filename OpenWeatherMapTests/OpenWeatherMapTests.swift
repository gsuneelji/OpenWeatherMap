//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Suneel on 3/29/17.
//  Copyright © 2017 Suneel. All rights reserved.
//

import XCTest
import Alamofire
import ObjectMapper
@testable import OpenWeatherMap

class OpenWeatherMapTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    private struct JSONFile {
        static let city = "City"
    }
    
    func testParsingCityFieldsWithExpectedValues() {
        guard let city = Mapper<City>().map(JSONObject: loadJSONFileWithName(JSONFile.city)) else {
            XCTFail()
            return
        }

        XCTAssertEqual(city.name, "London")
        XCTAssertEqual(city.responseCode, 200)
        
        let cityWeather = city.cityWeather?.first
        XCTAssertEqual(cityWeather?.description, "light rain")
        XCTAssertEqual(cityWeather?.icon, "10n")
        
        let cityMain = city.cityMain
        XCTAssertEqual(cityMain?.temperature, 289.24)
        XCTAssertEqual(cityMain?.humidity, 63)
        
        let citySys = city.citySys
        XCTAssertEqual(citySys?.sunrise, 1490852294)
        XCTAssertEqual(citySys?.sunset, 1490898726)
    }
    
    /// Load any sample json files from the test bundle
    func loadJSONFileWithName(_ filename: String) -> Any {
        let filePath = Bundle(for: classForCoder).path(forResource: filename, ofType: "json")!
        let fileURL = URL(fileURLWithPath: filePath)
        let data = try! Data(contentsOf: fileURL, options: .mappedIfSafe)
        return try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
    }
}
