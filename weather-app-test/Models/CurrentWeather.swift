//
//  CurrentWeather.swift
//  weather-app-test
//
//  Created by shyamlal on 14/12/21.
//

import Foundation

struct CurrentWeather: Codable {
    var location: LocationResponse?
    var current: CurrentDetails?
}

struct LocationResponse: Codable {
    var name: String?
    var localtime: String?
}

struct CurrentDetails: Codable {
    var temp_c: Float?
    var is_day: Int?
    var condition: ConditionDetails?
    var wind_kph: Float?
    var humidity: Int?
}

struct ConditionDetails: Codable {
    var text: String?
}

struct DummyTest: Codable {
    var id: String?
}
