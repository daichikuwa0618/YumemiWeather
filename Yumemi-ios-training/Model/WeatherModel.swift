//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather
import Foundation

struct WeatherModel {
    let decoder = JSONDecoder()
    func reloading() -> WeatherViewState? {
        do {
            let weatherDataString = try YumemiWeather.fetchWeather("{\"area\": \"tokyo\", \"date\": \"2020-04-01T12:00:00+09:00\" }")
            let weatherData = weatherDataString.data(using: String.Encoding.utf8)!
            let decodedWeatherData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = Weather(rawValue: decodedWeatherData.weather)!
            let lowestTemperature = decodedWeatherData.min_temp
            let highestTemperature = decodedWeatherData.max_temp
            return WeatherViewState(weather: weather, lowestTemperature: lowestTemperature, highestTemperature: highestTemperature)
        } catch {
            return nil
        }
    }
}
