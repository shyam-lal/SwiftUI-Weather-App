//
//  CurrentWeather.swift
//  weather-app-test
//
//  Created by shyamlal on 14/12/21.
//

import Foundation

struct CurrentWeather: Codable {

    var location: LocationResponse?
}

struct LocationResponse: Codable {
    
    var name: String?
    var localtime: String?
}

struct DummyTest: Codable {
    var id: String?
}