//
//  WeatherView.swift
//  Yumemi-ios-training
//
//  Created by 大塚 周 on 2021/04/30.
//

import UIKit
import YumemiWeather

class WeatherView: UIView {
    
    var delegate: WeatherDelegate?
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
        stackViewForLabels.addArrangedSubview(highestTemperatureLabel)
        stackViewForImageViewAndLabels.addArrangedSubview(stackViewForLabels)
        
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
        weatherImageView.image = UIImage(named: "sun")
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
        reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)
    }
    
    @objc func reload() {
        delegate?.reload()
    }
}
