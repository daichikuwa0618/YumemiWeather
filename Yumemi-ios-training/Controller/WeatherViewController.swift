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
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
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
        let result = weatherModel.reloading()
        var message = ""
        switch result {
        case .success(let state):
            weatherView.changeDisplay(weatherViewState: state)
        case .failure(let error):
            switch error {
            case .invalidParameterError:
                print(error.localizedDescription)
                message = "不適切な値を入力しています"
            case .unknownError:
                print(error.localizedDescription)
                message = "予期せぬエラーが発生しました"
            }
            let errorAlert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(errorAction)
            present(errorAlert, animated: true, completion: nil)
        }
    }
}
