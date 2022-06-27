//
//  DailyForecastCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 7/6/2022.
//

import UIKit

class ForecastDailyCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    
    static let cellId = "ForecastDailyCollectionViewCell"
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
        view.backgroundColor = UIColor(rgb: 0xE9EEFA)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private let dateLabel: UILabel = {
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
        imageView.image = UIImage(named: "sun")
        return imageView
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(12)
        label.text = "75%"
        label.textColor = UIColor(rgb: 0x204EC7)
        return label
    }()
    
    private let mainForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.text = "Shower"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let dailyTempRangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "7°-11°"
        label.textColor = UIColor(rgb: 0x000000)
        return label
    }()
}
//MARK: - setupViews
extension ForecastDailyCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(wrapperView)
        
        wrapperView.addSubview(dateLabel)
        wrapperView.addSubview(weatherImageView)
        wrapperView.addSubview(humidityLabel)
        wrapperView.addSubview(mainForecastLabel)
        wrapperView.addSubview(dailyTempRangeLabel)
        
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dateLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 6),
            
            weatherImageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10),
            weatherImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 6),
            weatherImageView.heightAnchor.constraint(equalToConstant: 17),
            weatherImageView.widthAnchor.constraint(equalToConstant: 15),
            
            humidityLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 5),
            humidityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            
            mainForecastLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor,constant: 66),
            mainForecastLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            
            dailyTempRangeLabel.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            dailyTempRangeLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -26)
        ])
    }
}
