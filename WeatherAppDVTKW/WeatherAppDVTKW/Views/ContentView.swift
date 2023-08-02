//
//  ContentView.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.


import SwiftUI
import Combine
import WeatherKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewViewModel()

    var body: some View {
        VStack{
            if let weather = viewModel.weatherManager.weather  {
                ScrollView {
                    VStack {
                        Spacer(minLength: 110)
                        CityAndTempView(weather: weather, viewModel: viewModel)

                        Spacer(minLength: 50)
                        HourlyWeatherView(weather: weather, viewModel: viewModel)

                        DailyWeatherView(weather: weather)
                        Spacer()
                    }
                }
            } else {
                VStack{
                    Spacer()
                    Text("Requesting weather")
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 40)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            Group {
                    if let weather = viewModel.weatherManager.weather {
                        let imageName: String
                        switch weather.currentWeather.condition {
                        case .clear:
                                imageName = "Sunny"
                            case .cloudy:
                                imageName = "Cloudy"
                            case .rain:
                                imageName = "Rainy"
                            default:
                                imageName = "Sunny"
                        }
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image("Sunny")
                            .resizable()
                            .scaledToFill()
                    }
                }
            )
        .edgesIgnoringSafeArea(.all)
        .task {
            await viewModel.weatherManager.requestWeatherForCurrentLocation()

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


