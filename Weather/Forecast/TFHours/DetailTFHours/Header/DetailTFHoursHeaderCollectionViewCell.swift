//
//  DetailTFHoursHeaderCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 25/6/2022.
//

import UIKit

class DetailTFHoursHeaderCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    
    static let cellId = "DetailTFHoursHeaderCollectionViewCell"
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13"
        label.font = UIFont.setAppMainFont(14)
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
    
    private let dotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(rgb: 0xFFFFFF).cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "rain")
        return imageView
    }()
    
    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "47%"
        label.font = UIFont.setAppMainFont(12)
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let rectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(rgb: 0x204EC7).cgColor
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.font = UIFont.setAppMainFont(14)
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
}
//MARK: - setupViews
extension DetailTFHoursHeaderCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(tempLabel)
        contentView.addSubview(degreeImageView)
        contentView.addSubview(dotLabel)
        contentView.addSubview(weatherImageView)
        contentView.addSubview(precipitationLabel)
        contentView.addSubview(rectLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            
            degreeImageView.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 1),
            degreeImageView.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: 4),
            degreeImageView.widthAnchor.constraint(equalToConstant: 5),
            degreeImageView.heightAnchor.constraint(equalTo: degreeImageView.widthAnchor),
            
            dotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dotLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 2),
            dotLabel.widthAnchor.constraint(equalToConstant: 5),
            dotLabel.heightAnchor.constraint(equalTo: dotLabel.widthAnchor),
            
            weatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherImageView.topAnchor.constraint(equalTo: dotLabel.bottomAnchor, constant: 37),
            weatherImageView.widthAnchor.constraint(equalToConstant: 20),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor),
            
            precipitationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            precipitationLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 4),
            
            rectLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rectLabel.topAnchor.constraint(equalTo: precipitationLabel.bottomAnchor, constant: 9),
            //            rectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            rectLabel.widthAnchor.constraint(equalToConstant: 4),
            rectLabel.heightAnchor.constraint(equalToConstant: 8),
            //
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: rectLabel.bottomAnchor, constant: 8),
            //            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
