//
//  Cities.swift
//  weather-app-test
//
//  Created by shyamlal on 28/12/21.
//

import Foundation


class City: Identifiable, ObservableObject {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

let cities = [
    City(id: 1, name: "Mumbai"),
    City(id: 2, name: "Paris"),
    City(id: 3, name: "New York"),
    City(id: 4, name: "Tokyo"),
    City(id: 5, name: "Jakartha"),
    City(id: 6, name: "Delhi"),
    City(id: 7, name: "Manila"),
    City(id: 8, name: "SHanghai"),
    City(id: 9, name: "Karachi"),
    City(id: 10, name: "Beijng"),
    City(id: 11, name: "Sao Polo"),
    City(id: 12, name: "London")
]
