//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/07.
//

import UIKit
import YumemiWeather

struct WeatherModel {
    let decoder = JSONDecoder()

    func reload(imageView: UIImageView, controller: UIViewController, lowestLabel: UILabel, highestLabel: UILabel) {
        do {
            let weatherJsonString = try YumemiWeather.fetchWeather("{\"area\":\"tokyo\",\"date\":\"2020-04-01T12:00:00+09:00\"}")
            guard let weatherData = weatherJsonString.data(using: String.Encoding.utf8) else { return }
            do {
                let items = try JSONSerialization.jsonObject(with: weatherData) as? [String:Any]
                lowestLabel.text = String(items?["min_temp"] as? Int ?? 0)
                highestLabel.text = String(items?["max_temp"] as? Int ?? 0)
                imageView.image = UIImage(named: items?["weather"] as? String ?? "")
            }
        } catch {
            let errorAlert = UIAlertController(title: "エラー", message: "エラーが発生しました", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(errorAction)
            controller.present(errorAlert, animated: true, completion: nil)
        }
    }
}
