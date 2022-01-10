//
//  String+Additions.swift
//  weather-app-test
//
//  Created by shyamlal on 07/01/22.
//

import Foundation

extension String {
    func stringToDate() -> Date {
        var dateString = self
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        return date ?? Date()
    }
}
