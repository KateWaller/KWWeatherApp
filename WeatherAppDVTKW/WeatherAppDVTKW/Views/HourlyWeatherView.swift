//
//  HourlyWeatherView.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import SwiftUI
import WeatherKit

struct HourlyWeatherView: View {
    @State var weather: Weather
    @State var viewModel: ContentViewViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "clock")
                Text("HOURLY FORECAST")
            }
            .font(.caption)
            Divider()
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.weatherManager.shortenedHourWeather, id: \.date){ hourForecast in
                        VStack(spacing: 15){
                            Text("\(Calendar.current.component(.hour, from: hourForecast.date))")
                            Image(systemName: "\(hourForecast.symbolName).fill")
                                .symbolRenderingMode(.multicolor)
                            Text("\(hourForecast.temperature.value.roundDouble())°")
                        }
                        .padding(.horizontal, 15)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.gray.opacity(0.6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}



