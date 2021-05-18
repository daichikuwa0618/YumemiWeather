//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/04/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private(set) var weatherView = WeatherView()
    var weatherModel: WeatherModel?
    
    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.reloadButton.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
    }
    @objc func reloadButtonTapped() {
        weatherView.changeDisplay(weatherViewState: reload())
    }
    func reload() -> WeatherViewState? {
        guard let weatherString = weatherModel?.reload() else { return nil }
        switch weatherString {
        case "sunny":
            return WeatherViewState(weather: weatherString, color: .red)
        case "cloudy":
            return WeatherViewState(weather: weatherString, color: .gray)
        default:
            return WeatherViewState(weather: weatherString, color: .blue)
        }
    }
    
}

