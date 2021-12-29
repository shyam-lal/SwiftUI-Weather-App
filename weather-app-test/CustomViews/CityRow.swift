//
//  CityRow.swift
//  weather-app-test
//
//  Created by shyamlal on 28/12/21.
//

import SwiftUI

struct CityRow: View {
    var city: City
    var body: some View {
        HStack {
            Text(city.name)
        }
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(city: cities[0]).previewDevice("iPhone 11").previewLayout(.fixed(width: 500, height: 100))
    }
}
