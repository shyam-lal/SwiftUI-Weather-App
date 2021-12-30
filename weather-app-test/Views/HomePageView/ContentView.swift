//
//  ContentView.swift
//  weather-app-test
//
//  Created by Qburst on 29/08/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

struct ContentView: View {
    
    @State private var currentCity = "Mumbai"
    @State var currentWeatherDataSource: CurrentWeather?
    @State private var isNight = false
    
    
    func callAPI() {
        WeatherManager.getCurrentWeatherDetails(city: currentCity)
            WeatherManager.didFetchData = {
                currentWeatherDataSource = WeatherManager.weatherData
                isNight = (currentWeatherDataSource?.current?.is_day == 1 ? false : true)
                print(currentWeatherDataSource)
            }
}
    
    //MARK: ContentView
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundView(isNight: $isNight)
                
                //MARK: Main Stack
                VStack {
                    LocationView(location: currentWeatherDataSource?.location?.name ?? "Mumbai").padding(.top, 15)
                    
                    MainTemperatureView(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill" , date: currentWeatherDataSource?.current?.temp_c ?? 0)
                        .padding(.bottom, 50)
                    
                    Spacer()
                    
                    HStack(spacing: 25) {
                        DailyWeatherView(day: "Mon", imageName: "cloud.sun.rain.fill", temperature: 20)
                        DailyWeatherView(day: "Tue", imageName: "cloud.sun.rain.fill", temperature: 50)
                        DailyWeatherView(day: "Wed", imageName: "cloud.sun.rain.fill", temperature: 10)
                        DailyWeatherView(day: "Thu", imageName: "cloud.sun.rain.fill", temperature: 15)
                        DailyWeatherView(day: "Fri", imageName: "cloud.sun.rain.fill", temperature: 22)
                    }
                    Spacer()
                    
                    //MARK: Button
                    //                Button {
                    //                    isNight.toggle()
                    //                } label: {
                    //                    Text("Change day time")
                    //                        .frame(width: 280, height: 50)
                    //                        .background(Color.white)
                    //                        .font(.system(size: 20, weight: .bold, design: .default))
                    //                        .cornerRadius(10.0)
                    //                }
                }.onAppear(perform: {
                    callAPI()
                })
            }.navigationBarHidden(true)
        }
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
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .white : Color("lightBlue")])
                       ,startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainTemperatureView: View {
    var weatherImage: String
    var date: Float
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .padding(.bottom, 50)
            
            Text("\(Int(date))°c")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

struct LocationView: View {
    var location: String
    var body: some View {
        
        NavigationLink(destination: CityListingView()) {
            Text(location)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
        
        //        NavigationLink(destination: CityListingView()) {
        //            }
        //            Text(location)
        //                .font(.system(size: 32, weight: .medium, design: .default))
        //                .foregroundColor(.white)
        //                .padding()
    }
}
