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
            return WeatherViewState(weather: .sunny, color: .red)
        case .cloudy:
            return WeatherViewState(weather: .cloudy, color: .gray)
        case .rainy:
            return WeatherViewState(weather: .rainy, color: .blue)
        }
    }
}


