//
//  CityAndTempView.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import SwiftUI
import WeatherKit

struct CityAndTempView: View {
    @State var weather: Weather
    @State var viewModel: ContentViewViewModel
    
    var body: some View {
        if let dailyForecast = weather.dailyForecast.first {
            VStack(spacing: 5){
                Text(viewModel.weatherManager.locationManager.city)
                    .font(.title)
                Text("\(weather.currentWeather.temperature.value.roundDouble())°")
                    .font(.system(size: 80))
                Text(weather.currentWeather.condition.description)
                HStack{
                    Text("L: \(dailyForecast.lowTemperature.value.roundDouble())°")
                    Text("H: \(dailyForecast.highTemperature.value.roundDouble())°")
                }
            }
            .foregroundColor(.white)
        }
    }
}
