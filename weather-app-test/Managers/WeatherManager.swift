//
//  WeatherManager.swift
//  weather-app-test
//
//  Created by shyamlal on 14/12/21.
//

import Foundation

class WeatherManager {
    
    static func getCurrentWeatherDetails() {
        
        // Create URL
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=8d5ce6ac991441f89db123830211312&q=London&aqi=no")
//        let url = URL(string: "https://606359fe0133350017fd318b.mockapi.io/api/v1/dummy")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"

        // Create Data Task
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                if let books = try? JSONDecoder().decode(CurrentWeather.self, from: data) {
                    print(books)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}
