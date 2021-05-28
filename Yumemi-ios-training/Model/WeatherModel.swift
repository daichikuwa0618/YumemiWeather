//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather

struct WeatherModel {
    var errorMessage = ""
    
    mutating func reloading() -> Result<WeatherViewState, YumemiWeatherError> {
        do {
            let weatherString = try YumemiWeather.fetchWeather(at: "tokyo")
            guard let weather = Weather(rawValue: weatherString) else { fatalError("Weatherのイニシャライザに失敗") }
            return .success(WeatherViewState(weather: weather))
        } catch let error as YumemiWeatherError {
            switch error {
            case .invalidParameterError:
                errorMessage = "不適切な値が設定されています"
            case .unknownError:
                errorMessage = "予期せぬエラーが発生しました"
            }
            return .failure(error)
        } catch {
            fatalError("想定外のエラーが発生しました")
        }
    }
}


