//
//  DetailTFHoursTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 25/6/2022.
//

import UIKit

class DetailTFHoursTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DetailTFHoursTableViewCell"
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.text = "fri 16/04"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let timeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "12:00"
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
    private let tempLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.text = "12"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let degreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "degree")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0x292626)
        return imageView
    }()
    
    private let degreeValueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "degree")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0x9A9696)
        return imageView
    }()
    
    private let tempFieelsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Feels like..."
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let tempFieelsValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "10"
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()

    private let windSpeedLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Wind"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let windSpeedValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "2 m/s NNW"
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()

    private let humidityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Precipitation"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let humidityValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "0%"
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
    private let cloudinessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Cloudiness"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let cloudinessValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "29%"
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
    private let tempFeelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tempFeel")
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

    private let cloudinessImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudiness")
        return imageView
    }()
}
//MARK: - setupViews
extension DetailTFHoursTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(degreeImageView)
        contentView.addSubview(degreeValueImageView)
        contentView.addSubview(tempFieelsLabel)
        contentView.addSubview(tempFieelsValueLabel)
        contentView.addSubview(windSpeedLabel)
        contentView.addSubview(windSpeedValueLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(humidityValueLabel)
        contentView.addSubview(cloudinessLabel)
        contentView.addSubview(cloudinessValueLabel)
        contentView.addSubview(tempFeelImageView)
        contentView.addSubview(windSpeedImageView)
        contentView.addSubview(humidityImageView)
        contentView.addSubview(cloudinessImageView)

        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
//            timeLabel.heightAnchor.constraint(equalToConstant: 19),
            
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            tempLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
//            tempLabel.heightAnchor.constraint(equalToConstant: 22),
            
            degreeImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 1),
            degreeImageView.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: 3),
            degreeImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeImageView.heightAnchor.constraint(equalTo: degreeImageView.widthAnchor),
            
            tempFeelImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 32),
            tempFeelImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            tempFeelImageView.widthAnchor.constraint(equalToConstant: 16),
            tempFeelImageView.heightAnchor.constraint(equalTo: tempFeelImageView.widthAnchor),
            
            tempFieelsLabel.leadingAnchor.constraint(equalTo: tempFeelImageView.trailingAnchor, constant: 5),
            tempFieelsLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            tempFieelsLabel.heightAnchor.constraint(equalToConstant: 16),
            
            tempFieelsValueLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            tempFieelsValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tempFieelsValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            degreeValueImageView.leadingAnchor.constraint(equalTo: tempFieelsValueLabel.trailingAnchor, constant: 1),
            degreeValueImageView.bottomAnchor.constraint(equalTo: tempFieelsValueLabel.topAnchor, constant: 3),
            degreeValueImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeValueImageView.heightAnchor.constraint(equalTo: degreeImageView.widthAnchor),
            
            windSpeedImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 32),
            windSpeedImageView.topAnchor.constraint(equalTo: tempFeelImageView.bottomAnchor, constant: 12),
            windSpeedImageView.widthAnchor.constraint(equalToConstant: 16),
            windSpeedImageView.heightAnchor.constraint(equalTo: windSpeedImageView.widthAnchor),
            
            windSpeedLabel.leadingAnchor.constraint(equalTo: windSpeedImageView.trailingAnchor, constant: 5),
            windSpeedLabel.topAnchor.constraint(equalTo: tempFieelsLabel.bottomAnchor, constant: 12),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 16),
            
            windSpeedValueLabel.topAnchor.constraint(equalTo: tempFieelsValueLabel.bottomAnchor, constant: 12),
            windSpeedValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            windSpeedValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            humidityImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 32),
            humidityImageView.topAnchor.constraint(equalTo: windSpeedImageView.bottomAnchor, constant: 12),
            humidityImageView.widthAnchor.constraint(equalToConstant: 16),
            humidityImageView.heightAnchor.constraint(equalTo: humidityImageView.widthAnchor),
            
            humidityLabel.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 5),
            humidityLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 12),
            humidityLabel.heightAnchor.constraint(equalToConstant: 16),
            
            humidityValueLabel.topAnchor.constraint(equalTo: windSpeedValueLabel.bottomAnchor, constant: 12),
            humidityValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            humidityValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            cloudinessImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 32),
            cloudinessImageView.topAnchor.constraint(equalTo: humidityImageView.bottomAnchor, constant: 12),
            cloudinessImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cloudinessImageView.widthAnchor.constraint(equalToConstant: 16),
            cloudinessImageView.heightAnchor.constraint(equalTo: cloudinessImageView.widthAnchor),
            
            cloudinessLabel.leadingAnchor.constraint(equalTo: cloudinessImageView.trailingAnchor, constant: 5),
            cloudinessLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 12),
            cloudinessLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cloudinessLabel.heightAnchor.constraint(equalToConstant: 16),
            
            cloudinessValueLabel.topAnchor.constraint(equalTo: humidityValueLabel.bottomAnchor, constant: 12),
            cloudinessValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cloudinessValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cloudinessValueLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
