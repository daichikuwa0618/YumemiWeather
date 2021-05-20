//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather

struct WeatherModel {
    func reloading() -> WeatherViewState  {
        let weatherString = YumemiWeather.fetchWeather()
        let weather = Weather(rawValue: weatherString)!
        switch weather {
        case .sunny:
            return WeatherViewState(weather: .sunny)
        case .cloudy:
            return WeatherViewState(weather: .cloudy)
        case .rainy:
            return WeatherViewState(weather: .rainy)
        }
    }
}


