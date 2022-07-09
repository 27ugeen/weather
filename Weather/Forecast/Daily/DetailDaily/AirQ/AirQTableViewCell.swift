//
//  AirQTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 27/6/2022.
//

import UIKit

class AirQTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "AirQTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let airQLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Air Quality"
        label.font = UIFont.setAppMainFont(18)
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let airQValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "42"
        label.font = UIFont.setAppMainFont(30)
        label.textColor = UIColor(rgb: 0x000000)
        return label
    }()
    
    private let airQColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "good"
        label.textAlignment = .center
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.backgroundColor = UIColor(rgb: 0x81CA80)
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()
    
    private let airQDescriptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Air quality is considered satisfactory and air pollution is insignificant within the normal range"
        label.numberOfLines = 0
        label.font = UIFont.setAppMainFont(14)
        label.textColor = UIColor(rgb: 0x9A9696)
        return label
    }()
    
}
//MARK: - setupView
extension AirQTableViewCell {
    private func setupViews() {
        contentView.addSubview(airQLabel)
        contentView.addSubview(airQValueLabel)
        contentView.addSubview(airQColorLabel)
        contentView.addSubview(airQDescriptLabel)
        
        NSLayoutConstraint.activate([
            airQLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            airQLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            airQValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            airQValueLabel.topAnchor.constraint(equalTo: airQLabel.bottomAnchor, constant: 10),
            
            airQColorLabel.leadingAnchor.constraint(equalTo: airQValueLabel.trailingAnchor, constant: 15),
            airQColorLabel.topAnchor.constraint(equalTo: airQLabel.bottomAnchor, constant: 15),
            airQColorLabel.widthAnchor.constraint(equalToConstant: 95),
            airQColorLabel.heightAnchor.constraint(equalToConstant: 26),
            
            airQDescriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            airQDescriptLabel.topAnchor.constraint(equalTo: airQValueLabel.bottomAnchor, constant: 10),
            airQDescriptLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            airQDescriptLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
