//
//  CityListingView.swift
//  weather-app-test
//
//  Created by shyamlal on 27/12/21.
//

import SwiftUI

struct CityListingView_Previews: PreviewProvider {
    static var previews: some View {
        CityListingView()
            .previewDevice("iPhone 11")
    }
}

struct CityListingView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State public var setCity: (() -> Void)?
    var body: some View {
        List(cities) {
            city in
            CityRow(city: city)
                .onTapGesture {
                    UserDefaults.standard.set(city.name, forKey: "currentCity")
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}
