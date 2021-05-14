//
//  WeatherViewState.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/14.
//
import UIKit

struct WeatherViewState {
    var weather: String
    var color: UIColor
    init(weather: String, color: UIColor) {
        self.weather = weather
        self.color = color
    }
}
