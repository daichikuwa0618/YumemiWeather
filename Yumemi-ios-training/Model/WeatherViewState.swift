//
//  WeatherViewState.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/14.
//
import UIKit

struct WeatherViewState {
    let weather: Weather
    let color: UIColor
    
    init(weather: Weather) {
        self.weather = weather
        switch weather {
        case .sunny:
            self.color = .red
        case .cloudy:
            self.color = .gray
        case .rainy:
            self.color = .blue
        }
    }
}
