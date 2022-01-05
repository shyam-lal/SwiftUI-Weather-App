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

//struct LocationResponse: Codable {
//    var name: String?
//    var localtime: String?
//}
//
//struct CurrentDetails: Codable {
//    var temp_c: Float?
//    var is_day: Int?
//    var condition: ConditionDetails?
//    var wind_kph: Float?
//    var humidity: Int?
//}

struct ForecastData: Codable {
    var forecastday: ForecastDay?
}

struct ForecastDay: Codable {
    var forecastDataSource: [ForecastDataSource]
}

struct ForecastDataSource: Codable {
    var date: String
    var day: WeatherData
}

struct WeatherData: Codable {
    var avgtemp_c: String
    var condition: ConditionModel
}

struct ConditionModel: Codable {
    var text: String
}
