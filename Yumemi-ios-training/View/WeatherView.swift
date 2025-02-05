//
//  WeatherView.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/04/30.
//

import UIKit

class WeatherView: UIView {
    
    let stackViewForImageViewAndLabels = UIStackView()
    let weatherImageView = UIImageView()
    let stackViewForLabels = UIStackView()
    let lowestTemperatureLabel = UILabel()
    let highestTemperatureLabel = UILabel()
    let closeButton = UIButton(type: .system)
    let reloadButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
        addSubviewConstraints()
    }
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupStackViewForImageViewAndLabels()
        setupStackViewForLabels()
        setupWeatherImage()
        setupLowestTemperatureLabel()
        setupHighestTemperatureLabel()
        setupCloseButton()
        setupReloadButton()
    }
    
    private func addSubviewConstraints() {
        //天気を表示するimageViewと気温を表示するlabelを入れるためのStackViewの追加と制約
        addSubview(stackViewForImageViewAndLabels)
        stackViewForImageViewAndLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewForImageViewAndLabels.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewForImageViewAndLabels.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        //天気を表示するimageViewの追加と制約
        stackViewForImageViewAndLabels.addArrangedSubview(weatherImageView)
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            weatherImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        //最低/最高気温を表示するlabelの追加と制約
        addSubview(stackViewForLabels)
        stackViewForLabels.addArrangedSubview(lowestTemperatureLabel)
        stackViewForLabels.addArrangedSubview(highestTemperatureLabel)
        stackViewForImageViewAndLabels.addArrangedSubview(stackViewForLabels)
        //close/reloadボタンの追加と制約
        addSubview(closeButton)
        addSubview(reloadButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: lowestTemperatureLabel.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: stackViewForImageViewAndLabels.bottomAnchor, constant: 80),
            reloadButton.centerXAnchor.constraint(equalTo: highestTemperatureLabel.centerXAnchor),
            reloadButton.topAnchor.constraint(equalTo: stackViewForLabels.bottomAnchor, constant: 80)
        ])
    }
    
    private func setupStackViewForImageViewAndLabels() {
        stackViewForImageViewAndLabels.axis = .vertical
        stackViewForImageViewAndLabels.alignment = .fill
        stackViewForImageViewAndLabels.distribution = .fill
    }
    
    private func setupStackViewForLabels() {
        stackViewForLabels.axis = .horizontal
        stackViewForLabels.alignment = .fill
        stackViewForLabels.distribution = .fillEqually
    }
    
    private func setupWeatherImage() {
        weatherImageView.image = UIImage(systemName: "sun.max")
    }
    
    private func setupLowestTemperatureLabel() {
        lowestTemperatureLabel.text = "25"
        lowestTemperatureLabel.textColor = .systemBlue
        lowestTemperatureLabel.textAlignment = .center
    }
    
    private func setupHighestTemperatureLabel() {
        highestTemperatureLabel.text = "35"
        highestTemperatureLabel.textColor = .systemRed
        highestTemperatureLabel.textAlignment = .center
    }
    
    private func setupCloseButton() {
        closeButton.setTitle("Close", for: .normal)
    }
    
    private func setupReloadButton() {
        reloadButton.setTitle("Reload", for: .normal)
    }
    
    func changeDisplay(weatherViewState: WeatherViewState) {
        weatherImageView.image = UIImage(named: weatherViewState.weather.rawValue)
        weatherImageView.tintColor = weatherViewState.color
    }
}
