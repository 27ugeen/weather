//
//  DailyForecastTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 7/6/2022.
//

import UIKit

class ForecastDailyTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "ForecastDailyTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0xE9EEFA)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x9A9696)
        label.text = "17/4"
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "rain")
        return imageView
    }()
    
    let popLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(12)
        label.text = "75%"
        label.textColor = UIColor(rgb: 0x204EC7)
        return label
    }()
    
    let mainForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "Shower"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    let dailyTempRangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "7°-11°"
        label.textColor = UIColor(rgb: 0x000000)
        return label
    }()
    
    private let chevronRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor(rgb: 0x000000)
        return imageView
    }()
}
//MARK: - setupViews
extension ForecastDailyTableViewCell {
    private func setupViews() {
        contentView.addSubview(wrapperView)
        
        wrapperView.addSubview(dateLabel)
        wrapperView.addSubview(weatherImageView)
        wrapperView.addSubview(popLabel)
        wrapperView.addSubview(mainForecastLabel)
        wrapperView.addSubview(dailyTempRangeLabel)
        wrapperView.addSubview(chevronRightImageView)
        
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            wrapperView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            //            wrapperView.heightAnchor.constraint(equalToConstant: 56),
            
            dateLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 6),
            
            weatherImageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10),
            weatherImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 6),
            weatherImageView.heightAnchor.constraint(equalToConstant: 17),
            weatherImageView.widthAnchor.constraint(equalToConstant: 15),
            
            popLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 5),
            popLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            
            mainForecastLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor,constant: 66),
            mainForecastLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            
            dailyTempRangeLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            dailyTempRangeLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -26),
            
            chevronRightImageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            chevronRightImageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -10),
            chevronRightImageView.widthAnchor.constraint(equalToConstant: 8),
            chevronRightImageView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
}
