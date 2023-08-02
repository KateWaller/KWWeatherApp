//
//  DailyWeatherView.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import SwiftUI
import WeatherKit

struct DailyWeatherView: View {
    @State var weather: Weather
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "calendar")
                Text("10 Day Forecast")
                Spacer()
            }
            .font(.caption)
            Divider()
            
            ForEach(weather.dailyForecast, id: \.date){ dailyForecast in
                HStack{
                    Text(dailyForecast.date.weekDay())
                        .frame(width: 50 , alignment: .leading)
                    Spacer()
                    
                    Image(systemName: "\(dailyForecast.symbolName).fill")
                        .symbolRenderingMode(.multicolor)
                    Spacer()
                    
                    Text("\(dailyForecast.lowTemperature.value.roundDouble())°")
                    TempBarView(currentTemp: weather.currentWeather.temperature.value, minTemp: dailyForecast.lowTemperature.value, maxTemp: dailyForecast.highTemperature.value, isToday: checkIsToday(date: dailyForecast.date))
                        .frame(width: 100, height: 8)
                    Text("\(dailyForecast.highTemperature.value.roundDouble())°")
                }
                .padding(.top, 5)
                Divider()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Color.gray.opacity(0.6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    func checkIsToday(date: Date) -> Bool{
        date.timeIntervalSince(Date()) < 100
    }
}

