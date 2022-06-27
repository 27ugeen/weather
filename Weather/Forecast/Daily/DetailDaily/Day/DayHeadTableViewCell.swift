//
//  DayHeadTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DayHeadTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DayHeadTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "Day/Night"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "rain")
        return imageView
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(30)
        label.text = "13"
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
    
    private let mainForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.text = "Shower"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let tempFeelsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "tempFeel")
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
    
    let tempFieelsValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "30"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let degreeValueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "degree")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0x292626)
        return imageView
    }()
    
    private let lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "line")
        //        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0x2204EC7)
        return imageView
    }()
}
//MARK: - setupViews
extension DayHeadTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(weatherImageView)
        contentView.addSubview(tempLabel)
        contentView.addSubview(degreeImageView)
        contentView.addSubview(mainForecastLabel)
        contentView.addSubview(tempFeelsImageView)
        contentView.addSubview(tempFieelsLabel)
        contentView.addSubview(tempFieelsValueLabel)
        contentView.addSubview(degreeValueImageView)
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            
            weatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            weatherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            weatherImageView.widthAnchor.constraint(equalToConstant: 30),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor),
            
            tempLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            degreeImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 1),
            degreeImageView.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: 5),
            degreeImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeImageView.heightAnchor.constraint(equalTo: degreeImageView.widthAnchor),
            
            mainForecastLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainForecastLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 11),
            
            tempFeelsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tempFeelsImageView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 66),
            tempFeelsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            tempFeelsImageView.widthAnchor.constraint(equalToConstant: 20),
            tempFeelsImageView.heightAnchor.constraint(equalTo: tempFeelsImageView.widthAnchor),
            
            tempFieelsLabel.leadingAnchor.constraint(equalTo: tempFeelsImageView.trailingAnchor, constant: 15),
            tempFieelsLabel.topAnchor.constraint(equalTo: mainForecastLabel.bottomAnchor, constant: 28),
            
            tempFieelsValueLabel.topAnchor.constraint(equalTo: mainForecastLabel.bottomAnchor, constant: 25),
            tempFieelsValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            degreeValueImageView.leadingAnchor.constraint(equalTo: tempFieelsValueLabel.trailingAnchor, constant: 1),
            degreeValueImageView.bottomAnchor.constraint(equalTo: tempFieelsValueLabel.topAnchor),
            degreeValueImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeValueImageView.heightAnchor.constraint(equalTo: degreeValueImageView.widthAnchor)
        ])
    }
}
