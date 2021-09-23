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
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            //MARK: Main Stack
            VStack {
                LocationView(location: "Dummy Location")
                
                MainTemperatureView(weatherImage: "cloud.sun.fill", temperature: 20)
                
                HStack(spacing: 25) {
                    DailyWeatherView(day: "Mon", imageName: "cloud.sun.rain.fill", temperature: 20)
                    DailyWeatherView(day: "Tue", imageName: "cloud.sun.rain.fill", temperature: 50)
                    DailyWeatherView(day: "Wed", imageName: "cloud.sun.rain.fill", temperature: 10)
                    DailyWeatherView(day: "Thu", imageName: "cloud.sun.rain.fill", temperature: 15)
                    DailyWeatherView(day: "Fri", imageName: "cloud.sun.rain.fill", temperature: 22)
                }
                Spacer()
                
                //MARK: Button
                Button {
                    print("tapped")
                } label: {
                    Text("Change day time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10.0)
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
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)*")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainTemperatureView: View {
    var weatherImage: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)*")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

struct LocationView: View {
    var location: String
    var body: some View {
        Text(location)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
