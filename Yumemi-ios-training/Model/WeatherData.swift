//
//  WeatherData.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/21.
//

import Foundation
struct WeatherData: Codable {
    let max_temp: Int
    let min_temp: Int
    let weather: String
}
