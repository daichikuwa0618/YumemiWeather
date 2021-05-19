//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather

<<<<<<< HEAD
struct WeatherModel {
    func reloading() -> WeatherViewState? {
        do {
            let weatherString = try YumemiWeather.fetchWeather(at: "tokyo")
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
=======
struct WeatherDataSource {
    func reload() throws -> String  {
        try YumemiWeather.fetchWeather(at: "{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }")
>>>>>>> acc2c8b... no message
    }
}


