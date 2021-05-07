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
    let highestTemparatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupstackViewForImageViewAndLabels()
        setupstackViewForLabels()
        setupWeatherImage()
        addSubviewConstraints()
        setupLowestTemperatureLabel()
        setupHighestTemperatureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewConstraints() {
        addSubview(stackViewForImageViewAndLabels)
        stackViewForImageViewAndLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewForImageViewAndLabels.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewForImageViewAndLabels.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        stackViewForImageViewAndLabels.addArrangedSubview(weatherImageView)
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            weatherImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        
        addSubview(stackViewForLabels)
        stackViewForLabels.addArrangedSubview(lowestTemperatureLabel)
        stackViewForLabels.addArrangedSubview(highestTemparatureLabel)
        stackViewForImageViewAndLabels.addArrangedSubview(stackViewForLabels)
        
    }
    
    private func setupstackViewForImageViewAndLabels() {
        stackViewForImageViewAndLabels.axis = .vertical
        stackViewForImageViewAndLabels.alignment = .fill
        stackViewForImageViewAndLabels.distribution = .fill
    }
    
    private func setupstackViewForLabels() {
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
        highestTemparatureLabel.text = "35"
        highestTemparatureLabel.textColor = .systemRed
        highestTemparatureLabel.textAlignment = .center
    }
}
