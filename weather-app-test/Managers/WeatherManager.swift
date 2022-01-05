//
//  WeatherManager.swift
//  weather-app-test
//
//  Created by shyamlal on 14/12/21.
//

import Foundation

class WeatherManager {
    
    static var didFetchData: (() -> Void)?
    static var weatherData: CurrentWeather?
//    static var forecastData
    
    static func getCurrentWeatherDetails(city: String) {
        // Create URL
        var urlComponents = URLComponents(string: "https://api.weatherapi.com/v1/current.json")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: "8d5ce6ac991441f89db123830211312"),
            URLQueryItem(name: "q", value: city)
        ]
        let url = urlComponents?.url
//        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=8d5ce6ac991441f89db123830211312&q=London")
//        let url = URL(string: "https://606359fe0133350017fd318b.mockapi.io/api/v1/dummy")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"

        // Create Data Task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let weather = try? JSONDecoder().decode(CurrentWeather.self, from: data) {
//                    print(weather)
                    weatherData = weather
                    didFetchData?()
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
    
    static func getWeatherForecast(city: String) {
        var urlComponents = URLComponents(string: "http://api.weatherapi.com/v1/forecast.json")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: ""),
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "days", value: "3"),
            URLQueryItem(name: "aqi", value: "no")
        ]
        let url = urlComponents?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let weather = try? JSONDecoder().decode(CurrentWeather.self, from: data) {
                    print(weather)
                } else {
                    print("Invalid response")
                }
            } else if let error = error {
                print("HTTP request Failed \(error)")
            }
        }
        task.resume()
    }
}
