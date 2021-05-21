//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather
import Foundation

struct WeatherModel {
    func reloading() -> WeatherViewState? {
        do {
            let weatherDataString = try YumemiWeather.fetchWeather("{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }")
            let weatherData = weatherDataString.data(using: String.Encoding.utf8)!
            let weather = Weather(rawValue: weatherString)!
            
            switch weather {
            case .sunny:
                return WeatherViewState(weather: .sunny)
            case .cloudy:
                return WeatherViewState(weather: .cloudy)
            case .rainy:
                return WeatherViewState(weather: .rainy)
            }
        } catch {
            return nil
        }
    }
}


