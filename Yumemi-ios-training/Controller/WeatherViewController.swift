//
//  ViewController.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/04/30.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let weatherView = WeatherView()
    let weatherModel: WeatherModel
    init(model: WeatherModel) {
        self.weatherModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.reloadButton.addTarget(self, action: #selector(reload(_:)), for: .touchUpInside)
    }
    
    @objc func reload(_ sender: UIButton) {
<<<<<<< HEAD
=======
        reloading()
    }
<<<<<<< HEAD
}

extension WeatherViewController: WeatherDelegate {
    func reloading() {
>>>>>>> f8a0bcb... no message
        if let state = weatherModel.reloading() {
            weatherView.changeDisplay(weatherViewState: state)
        } else {
=======
    func reload() -> WeatherViewState? {
        do {
            let weatherData = try weatherModel.reload().data(using: String.Encoding.utf8)!
            let parsedData = try JSONSerialization.jsonObject(with: weatherData)
            switch weatherString {
            case "sunny":
                return WeatherViewState(weather: weatherString, color: .red)
            case "cloudy":
                return WeatherViewState(weather: weatherString, color: .gray)
            default:
                return WeatherViewState(weather: weatherString, color: .blue)
            }
        } catch {
>>>>>>> acc2c8b... no message
            let errorAlert = UIAlertController(title: "エラー", message: "エラーが発生しました", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(errorAction)
            present(errorAlert, animated: true, completion: nil)
        }
    }
}
