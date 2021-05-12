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
        weatherView.delegate = self
        // Do any additional setup after loading the view.
    }
//テスト
    //ブランチ名を変更した(テスト)

}

extension WeatherViewController: WeatherDelegate {
    func reload() {
        weatherModel?.reload(imageView: weatherView.weatherImageView, controller: self, lowestLabel: weatherView.lowestTemperatureLabel, highestLabel: weatherView.highestTemperatureLabel)
    }
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
