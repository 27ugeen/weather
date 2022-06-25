//
//  CityMainHeaderTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 9/5/2022.
//

import UIKit

class ForecastHeaderTableViewCell: UITableViewCell {
//MARK: - props
    
    static let cellId = "ForecastHeaderTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - subviews

    private let headerView = ForecastHeaderView()
    
    private let dailyTempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "7°/13°"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let presentTempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(36)
        label.text = "13°"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let weatherDescriptLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "It is raining today"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let cloudinessLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "0"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "3 m/s"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let humidityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "75%"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let currentDateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "\(Date())"
        label.textColor = UIColor(rgb: 0xF6DD01)
        return label
    }()
    
    private let sunriseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(14)
        label.text = "5:41"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let sunsetLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(14)
        label.text = "19:31"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let sunriseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sunrise")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xF6DD01)
        return imageView
    }()
    
    private let sunsetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sunset")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xF6DD01)
        return imageView
    }()
    
    private let cloudinessImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudiness")
        return imageView
    }()
    
    private let windSpeedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "windSpeed")
        return imageView
    }()
    
    private let humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "humidity")
        return imageView
    }()
//MARK: - setupViews

extension ForecastHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        contentView.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor(rgb: 0x204EC7)
        headerView.clipsToBounds = true
        headerView.layer.cornerRadius = 5
        
        headerView.addSubview(dailyTempLabel)
        headerView.addSubview(presentTempLabel)
        headerView.addSubview(weatherDescriptLabel)
        headerView.addSubview(cloudinessLabel)
        headerView.addSubview(cloudinessImageView)
        headerView.addSubview(windSpeedLabel)
        headerView.addSubview(windSpeedImageView)
        headerView.addSubview(humidityLabel)
        headerView.addSubview(humidityImageView)
        headerView.addSubview(sunriseLabel)
        headerView.addSubview(sunriseImageView)
        headerView.addSubview(sunsetLabel)
        headerView.addSubview(sunsetImageView)
        headerView.addSubview(currentDateLabel)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            headerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 212),
            
            dailyTempLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 33),
            dailyTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            dailyTempLabel.heightAnchor.constraint(equalToConstant: 20),
            
            presentTempLabel.topAnchor.constraint(equalTo: dailyTempLabel.bottomAnchor, constant: 5),
            presentTempLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            presentTempLabel.heightAnchor.constraint(equalToConstant: 40),
            
            weatherDescriptLabel.topAnchor.constraint(equalTo: presentTempLabel.bottomAnchor, constant: 5),
            weatherDescriptLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            weatherDescriptLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentDateLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor,constant: 48),
            currentDateLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            sunriseLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor, constant: 44),
            sunriseLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            sunriseLabel.heightAnchor.constraint(equalToConstant: 19),
            
            sunsetLabel.topAnchor.constraint(equalTo: weatherDescriptLabel.bottomAnchor, constant: 44),
            sunsetLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            sunsetLabel.heightAnchor.constraint(equalToConstant: 19),
            
            sunriseImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 25),
            sunriseImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor,constant: -5),
            sunriseImageView.heightAnchor.constraint(equalToConstant: 17),
            sunriseImageView.widthAnchor.constraint(equalToConstant: 17),
            
            sunsetImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -25),
            sunsetImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor,constant: -5),
            sunsetImageView.heightAnchor.constraint(equalToConstant: 17),
            sunsetImageView.widthAnchor.constraint(equalToConstant: 17),
            
            cloudinessImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 77),
            cloudinessImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            cloudinessImageView.heightAnchor.constraint(equalToConstant: 18),
            cloudinessImageView.widthAnchor.constraint(equalToConstant: 21),
            
            cloudinessLabel.leadingAnchor.constraint(equalTo: cloudinessImageView.trailingAnchor, constant: 5),
            cloudinessLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            cloudinessLabel.heightAnchor.constraint(equalToConstant: 18),
            
            windSpeedLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 5),
            windSpeedLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 18),
            
            windSpeedImageView.trailingAnchor.constraint(equalTo: windSpeedLabel.leadingAnchor, constant: -5),
            windSpeedImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            windSpeedImageView.heightAnchor.constraint(equalToConstant: 18),
            windSpeedImageView.widthAnchor.constraint(equalToConstant: 25),
            
            humidityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -83),
            humidityLabel.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            humidityLabel.heightAnchor.constraint(equalToConstant: 18),
            
            humidityImageView.trailingAnchor.constraint(equalTo: humidityLabel.leadingAnchor, constant: -5),
            humidityImageView.bottomAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: -11),
            humidityImageView.heightAnchor.constraint(equalToConstant: 18),
            humidityImageView.widthAnchor.constraint(equalToConstant: 13)
        ])
    }
}
