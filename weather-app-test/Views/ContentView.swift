//
//  ContentView.swift
//  weather-app-test
//
//  Created by shyamlal on 29/08/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 7")
    }
}

struct ContentView: View {
    @State var currentWeatherDataSource: CurrentWeather?
    @State var weatherForecastDataSource: [ForecastDay]?
    @State private var isNight = false
    
    //MARK: API Calls
    func callAPI() {
        let currentCity = UserDefaults.standard.object(forKey: "currentCity") as? String
        WeatherManager.getCurrentWeatherDetails(city: currentCity ?? "Mumbai")
        WeatherManager.didFetchData = {
            currentWeatherDataSource = WeatherManager.weatherData
            isNight = (currentWeatherDataSource?.current?.is_day == 1 ? false : true)
            //                primaryTextColor = (isNight ? Color.black : Color.white)
            //                currentCity =  (currentWeatherDataSource?.location?.name)!
        }
    }
    
    func callForecastAPI() {
        let currentCity = UserDefaults.standard.object(forKey: "currentCity") as? String
        WeatherManager.getWeatherForecast(city: currentCity ?? "Mumbai")
        WeatherManager.didFetchForecastData = {
            weatherForecastDataSource = WeatherManager.forecastData
        }
    }
    
    
    //MARK: ContentView
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundView(isNight: $isNight)
                
                //MARK: Main Stack
                VStack {
                    LocationView(location: currentWeatherDataSource?.location?.name ?? "Mumbai", isNight: $isNight)
                        .padding(.top, 15)
                    
                    MainTemperatureView(isNight: $isNight, currentWeather: currentWeatherDataSource, weatherImage: isNight ? ImageNames.moonAndStars.rawValue : ImageNames.cloudAndSun.rawValue , date: currentWeatherDataSource?.current?.temp_c ?? 0)
                        .padding(.bottom, 50)
                    
                    Spacer()
                    
                    HStack(spacing: 30) {
                        
                        ForEach(0..<3, id: \.self) {
                            
                            DailyWeatherView(forecastDataSource: weatherForecastDataSource?[$0], isNight: $isNight)
                        }
                        
                        //                        DailyWeatherView(forecastDataSource: weatherForecastDataSource, isNight: $isNight, day: "Mon", imageName: ImageNames.cloudSunAndRain.rawValue, temperature: 20)
                        //                        DailyWeatherView(isNight: $isNight, day: "Tue", imageName: ImageNames.cloudSunAndRain.rawValue, temperature: 50)
                        //                        DailyWeatherView(isNight: $isNight, day: "Wed", imageName: ImageNames.cloudSunAndRain.rawValue, temperature: 10)
                        //                        DailyWeatherView(day: "Thu", imageName: "cloud.sun.rain.fill", temperature: 15)
                        //                        DailyWeatherView(day: "Fri", imageName: "cloud.sun.rain.fill", temperature: 22)
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
                    callForecastAPI()
                })
            }.navigationBarHidden(true)
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

//MARK: Main weather icon and data.
struct MainTemperatureView: View {
    @Binding var isNight: Bool
    var currentWeather: CurrentWeather?
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
                .foregroundColor(isNight ? Color.white : Color.black)
            
            Text((currentWeather?.current?.condition?.text) ?? "status")
                .font(.system(size: 20, weight: .light))
                .foregroundColor(isNight ? Color.white : Color.black)
            
            Text("\(Int(date))°c")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(isNight ? Color.white : Color.black)
            
            
            HStack(spacing: 5){
                Image(systemName: ImageNames.wind.rawValue)
                    .foregroundColor(isNight ? Color.white : Color.black)
                
                Text(String(currentWeather?.current?.wind_kph ?? 0) + " kph")
                    .foregroundColor(isNight ? Color.white : Color.black)
                
                Image(systemName: ImageNames.drop.rawValue)
                    .foregroundColor(isNight ? Color.white : Color.black)
                    .padding(.leading, 10)
                Text(String(currentWeather?.current?.humidity ?? 0))
                    .foregroundColor(isNight ? Color.white : Color.black)
            }
        }
        .padding(.bottom, 50)
    }
}

struct LocationView: View {
    
    var location: String
    @Binding var isNight: Bool
    var body: some View {
        NavigationLink(destination: CityListingView()) {
            Text(location)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(isNight ? Color.white : Color.black)
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
