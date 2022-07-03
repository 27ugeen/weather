//
//  SunMoonCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 27/6/2022.
//

import UIKit

class SunMoonCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    
    static let cellId = "SunMoonCollectionViewCell"
    
    private var cellWidth = UIScreen.main.bounds.width/2 - 32
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    let sunMoonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    let dayLengthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14h 27m"
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x000000)
        return label
    }()
    
    private let dottedLineTopImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dottedLine")
        return imageView
    }()
    
    let sunriseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunrise"
        label.font = UIFont.setAppMainFont(14)
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
    let sunriseValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:19"
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let dottedLineBotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dottedLine")
        return imageView
    }()
    
    let sunsetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sunset"
        label.font = UIFont.setAppMainFont(14)
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
    let sunsetValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19:42"
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
}
//MARK: - setupViews
extension SunMoonCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(sunMoonImageView)
        contentView.addSubview(dayLengthLabel)
        contentView.addSubview(dottedLineTopImageView)
        contentView.addSubview(sunriseLabel)
        contentView.addSubview(sunriseValueLabel)
        contentView.addSubview(dottedLineBotImageView)
        contentView.addSubview(sunsetLabel)
        contentView.addSubview(sunsetValueLabel)
        
        NSLayoutConstraint.activate([
            sunMoonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunMoonImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            sunMoonImageView.widthAnchor.constraint(equalToConstant: 15),
            sunMoonImageView.heightAnchor.constraint(equalTo: sunMoonImageView.widthAnchor),
            
            dayLengthLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            dayLengthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            dottedLineTopImageView.topAnchor.constraint(equalTo: sunMoonImageView.bottomAnchor, constant: 12),
            dottedLineTopImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dottedLineTopImageView.widthAnchor.constraint(equalToConstant: cellWidth),
            dottedLineTopImageView.heightAnchor.constraint(equalToConstant: 1),
            
            sunriseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunriseLabel.topAnchor.constraint(equalTo: dottedLineTopImageView.bottomAnchor, constant: 8),
            
            sunriseValueLabel.topAnchor.constraint(equalTo: dottedLineTopImageView.bottomAnchor, constant: 7),
            sunriseValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            dottedLineBotImageView.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 12),
            dottedLineBotImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dottedLineBotImageView.widthAnchor.constraint(equalToConstant: cellWidth),
            dottedLineBotImageView.heightAnchor.constraint(equalToConstant: 1),
            
            sunsetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunsetLabel.topAnchor.constraint(equalTo: dottedLineBotImageView.bottomAnchor, constant: 8),
            
            sunsetValueLabel.topAnchor.constraint(equalTo: dottedLineBotImageView.bottomAnchor, constant: 7),
            sunsetValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}
