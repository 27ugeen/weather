//
//  WeatherPreviewCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 11/5/2022.
//

import UIKit

class ForecastTFHoursCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    
    static let cellId = "ForecastTFHoursCollectionViewCell"
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = UIColor(rgb: 0x000000)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(rgb: 0xABBCEA).cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.font = UIFont.setAppMediumFont(12)
        label.textColor = UIColor(rgb: 0x9C9797)
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13"
        label.font = UIFont.setAppMediumFont(16)
        label.textColor = UIColor(rgb: 0x343030)
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
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
}
//MARK: - setupViews
extension ForecastTFHoursCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(wrapperView)
        
        wrapperView.addSubview(timeLabel)
        wrapperView.addSubview(tempLabel)
        wrapperView.addSubview(degreeImageView)
        wrapperView.addSubview(weatherImageView)
        
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            wrapperView.widthAnchor.constraint(equalToConstant: 42),
            wrapperView.heightAnchor.constraint(equalToConstant: 83),
            
            timeLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 11),
            timeLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            
            weatherImageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: 20),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor),
            
            tempLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -7),
            tempLabel.heightAnchor.constraint(equalToConstant: 18),
            
            degreeImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 1),
            degreeImageView.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: 3),
            degreeImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeImageView.heightAnchor.constraint(equalTo: degreeImageView.widthAnchor)
        ])
    }
}
