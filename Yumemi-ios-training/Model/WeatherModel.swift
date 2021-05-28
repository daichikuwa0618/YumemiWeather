//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import YumemiWeather

enum WeatherAppError: Error {
    case invalidParameterError(String)
    case unknownError(String)
}

struct WeatherModel {
    func reloading() -> Result<WeatherViewState, WeatherAppError> {
        do {
            let weatherString = try YumemiWeather.fetchWeather(at: "tokyo")
            guard let weather = Weather(rawValue: weatherString) else { fatalError("Weatherのイニシャライザに失敗") }
            return .success(WeatherViewState(weather: weather))
        } catch let error as YumemiWeatherError {
            switch error {
            case .invalidParameterError:
                return .failure(.invalidParameterError("不適切な値が設定されています"))
            case .unknownError:
                return .failure(.unknownError("予期せぬエラーが発生しました"))
            }
        } catch {
            fatalError("想定外のエラーが発生しました")
        }
    }
}

