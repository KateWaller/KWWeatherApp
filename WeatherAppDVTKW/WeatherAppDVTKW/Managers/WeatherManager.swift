//
//  WeatherManager.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import Foundation
import WeatherKit
import CoreLocation
import SwiftUI
import Combine
import Network
import WidgetKit

public class WeatherManager: ObservableObject{
    @Published var weather: Weather?
    @Published var locationManager = LocationManager()
    private let monitor = NWPathMonitor()
     
    private var anyCancellable: AnyCancellable? = nil
    
    init() {
        anyCancellable = locationManager.objectWillChange.sink { [weak self] (_) in
            self?.objectWillChange.send()
        }
    }
    
    var shortenedHourWeather: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) > 0
            }.prefix(24))
        } else {
            return []
        }
    }
    
    
    func requestWeatherForCurrentLocation() async {
       guard let userLocation = locationManager.userLocation else { return }
        do {
            weather = try await WeatherService.shared.weather(for: userLocation)
        } catch {
            print("\(error.localizedDescription)")
            weather = nil
        }
    }
    
    func requestWeatherForCurrentLocation2() async -> Weather? {
        print("REQUEST")
        guard let userLocation = locationManager.userLocation else { return nil }
        do {
            return try await WeatherService.shared.weather(for: userLocation)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
}

