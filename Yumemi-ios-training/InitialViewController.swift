//
//  InitialViewController.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/12.
//

import UIKit

class InitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let weatherViewController = WeatherViewController()
        weatherViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        weatherViewController.weatherModel = WeatherModel()
        present(weatherViewController, animated: true, completion: nil)
    }
}

