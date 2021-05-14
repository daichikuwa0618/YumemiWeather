//
//  WeatherDelegate.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

protocol WeatherViewDataSource {
    func reload() -> WeatherViewState?
}
