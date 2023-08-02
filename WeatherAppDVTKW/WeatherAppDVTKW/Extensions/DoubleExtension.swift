//
//  DoubleExtension.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return String(formatter.string(from: number) ?? "")
    }
}
