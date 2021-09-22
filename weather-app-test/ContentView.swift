//
//  ContentView.swift
//  weather-app-test
//
//  Created by Qburst on 29/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            //MARK: Main Stack
            VStack {
                Text("Dummy Location")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                //MARK: Temperature Stack
                VStack(spacing: 5) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("00*")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack(spacing: 25) {
                    DailyWeatherView(day: "Mon", imageName: "cloud.sun.rain.fill", temperature: 20)
                    DailyWeatherView(day: "Tue", imageName: "cloud.sun.rain.fill", temperature: 50)
                    DailyWeatherView(day: "Wed", imageName: "cloud.sun.rain.fill", temperature: 10)
                    DailyWeatherView(day: "Thu", imageName: "cloud.sun.rain.fill", temperature: 15)
                    DailyWeatherView(day: "Fri", imageName: "cloud.sun.rain.fill", temperature: 22)

                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

struct DailyWeatherView: View {
    
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text("\(temperature)")
                .font(.system(size: 45, weight: .bold))
                .foregroundColor(.white)
        }
    }
}
