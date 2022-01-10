//
//  ForecastModel.swift
//  weather-app-test
//
//  Created by shyamlal on 05/01/22.
//

import Foundation

struct ForecastModel: Codable {
    var forecast: ForecastData?
}

struct ForecastData: Codable {
    var forecastday: [ForecastDay]?
}

struct ForecastDay: Codable {
    var date: String?
    var day: WeatherData?
}

struct WeatherData: Codable {
    var avgtemp_c: Float?
    var condition: ConditionModel
}

struct ConditionModel: Codable {
    var text: String
}
