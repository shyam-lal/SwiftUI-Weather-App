//
//  ForecastView.swift
//  weather-app-test
//
//  Created by shyamlal on 10/01/22.
//

import SwiftUI

struct DailyWeatherView: View {
    var forecastDataSource: ForecastDay?
    @Binding var isNight: Bool
    var body: some View {
        VStack {
            Text(((forecastDataSource?.date?.stringToDate().dayOfWeek()) ?? "DAY").prefix(3))
                .font(.system(size: 20, weight: .light))
                .foregroundColor(isNight ? Color.white : Color.black)
            
            Image(systemName: ImageNames.cloudSunAndRain.rawValue)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(String(Int(forecastDataSource?.day?.avgtemp_c ?? 20)))°")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(isNight ? Color.white : Color.black)
        }
        .padding(.all, 10)
        .padding(.leading, 15)
        .padding(.trailing, 15)
        //        .overlay(RoundedRectangle(cornerRadius: 20)
        //                    .stroke(Color.white, lineWidth: 1))
        
        .background(RoundedRectangle(cornerRadius: 20).fill(isNight ? Color(#colorLiteral(red: 0.3588950293, green: 0.3624484454, blue: 0.3624484454, alpha: 1)) : Color(#colorLiteral(red: 0.1277317197, green: 0.8947259689, blue: 1, alpha: 1))))
    }
}

