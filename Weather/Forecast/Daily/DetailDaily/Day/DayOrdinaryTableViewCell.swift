//
//  DayOrdinaryTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DayOrdinaryTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DayOrdinaryTableViewCell"
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "windSpeed")
        return imageView
    }()
    
    let weatherCompLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Wind"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    let weatherCompValueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "5 m/s, WSW"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
}
//MARK: - setupViews
extension DayOrdinaryTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        
        contentView.addSubview(weatherImageView)
        contentView.addSubview(weatherCompLabel)
        contentView.addSubview(weatherCompValueLabel)
        
        NSLayoutConstraint.activate([
            weatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            weatherImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            weatherImageView.widthAnchor.constraint(equalToConstant: 20),
            weatherImageView.heightAnchor.constraint(equalTo: weatherImageView.widthAnchor),
//            weatherImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13),
            
            weatherCompLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 15),
            weatherCompLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            weatherCompValueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherCompValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

