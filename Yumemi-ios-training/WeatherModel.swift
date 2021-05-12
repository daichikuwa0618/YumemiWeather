//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/07.
//

import UIKit
import YumemiWeather

struct Weather: Codable {
    let max_temp: Int
    let min_temp: Int
    let weather: String
}

struct WeatherModel {
    let decoder = JSONDecoder()

    func reload(imageView: UIImageView, controller: UIViewController, lowestLabel: UILabel, highestLabel: UILabel) {
        do {
            let weatherJsonString = try YumemiWeather.fetchWeather("{\"area\":\"tokyo\",\"date\":\"2020-04-01T12:00:00+09:00\"}")
            guard let weatherData = weatherJsonString.data(using: String.Encoding.utf8) else { return }
            try changeDisplay(weatherData: weatherData, imageView: imageView, controller: controller, lowestLabel: lowestLabel, highestLabel: highestLabel)
        } catch {
            let errorAlert = UIAlertController(title: "エラー", message: "エラーが発生しました", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(errorAction)
            controller.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func changeDisplay(weatherData: Data, imageView: UIImageView, controller: UIViewController, lowestLabel: UILabel, highestLabel: UILabel) throws {
        let item = try decoder.decode(Weather.self, from: weatherData)
        lowestLabel.text = String(item.min_temp)
        highestLabel.text = String(item.max_temp)
        switch item.weather {
        case "sunny":
            imageView.image = UIImage(named: "sunny")
        case "cloudy":
            imageView.image = UIImage(named: "cloudy")
        default:
            imageView.image = UIImage(named: "rainy")
        }
    }
}
