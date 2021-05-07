//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/07.
//

import UIKit
import YumemiWeather

struct WeatherModel {
    func reload(imageView: UIImageView) {
        let weatherString = YumemiWeather.fetchWeather()
        switch weatherString {
        case "sunny":
            imageView.image = UIImage(named: "sunny")
        case "rainy":
            imageView.image = UIImage(named: "rainy")
        default:
            imageView.image = UIImage(named: "cloudy")
        }
    }
}
