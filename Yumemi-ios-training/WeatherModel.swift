//
//  WeatherModel.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/05/07.
//

import UIKit
import YumemiWeather

struct WeatherModel {
<<<<<<< HEAD
    func reload(imageView: UIImageView, controller: UIViewController) {
        do {
            let weatherString = try YumemiWeather.fetchWeather("{\"area\":\"tokyo\",\"date\":\"2020-04-01T12:00:00+09:00\"}")
            
            print(weatherString)
        } catch {
            let errorAlert = UIAlertController(title: "エラー", message: "エラーが発生しました", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "OK", style: .default)
            errorAlert.addAction(errorAction)
            controller.present(errorAlert, animated: true, completion: nil)
=======
    func reload(imageView: UIImageView) {
        do {
            let weatherString = try YumemiWeather.fetchWeather(at: "tokyo")
            switch weatherString {
            case "sunny":
                imageView.image = UIImage(named: "sunny")?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = .systemRed
            case "rainy":
                imageView.image = UIImage(named: "rainy")?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = .systemBlue
            default:
                imageView.image = UIImage(named: "cloudy")?.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = .systemGray
            }
            
        } catch {
            print("error")
>>>>>>> 0a304f3... 呼び出しAPIをThrows var に変更した。
        }
    }
}
