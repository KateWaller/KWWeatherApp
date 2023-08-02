//
//  ContentViewModel.swift
//  WeatherAppDVTKW
//
//  Created by Kate Waller on 2023/08/02.
//

import SwiftUI
import Combine

class ContentViewViewModel: ObservableObject {
    @Published var weatherManager = WeatherManager()
    
    private var anyCancellable: AnyCancellable? = nil
    init(){
        anyCancellable = weatherManager.objectWillChange
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.objectWillChange.send()
            }
    }
}
