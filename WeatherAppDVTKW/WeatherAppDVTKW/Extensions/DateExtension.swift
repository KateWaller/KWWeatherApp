//
//  DateExtension.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import Foundation

extension Date {
    func weekDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let weekDay = dateFormatter.string(from: self )
        return weekDay
    }
}
