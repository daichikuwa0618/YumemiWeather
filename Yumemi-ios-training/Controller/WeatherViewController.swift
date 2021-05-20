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
        weatherView.changeDisplay(weatherViewState: weatherModel.reloading())
    }
}



