//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 11/5/2022.
//

import Foundation
import UIKit

class ForecastTFHoursTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "ForecastTFHoursTableViewCell"
    private let collectionCellID = ForecastTFHoursCollectionViewCell.cellId
    
    var model: ForecastStub?
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    let forecastTFHoursButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle("Forecast for 24 hours".setUnderlineStyle(), for: .normal)
        button.setTitleColor(UIColor(rgb: 0x272722), for: .normal)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
//        button.addTarget(self, action: #selector(buttonTupped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tFHoursCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        view.register(ForecastTFHoursCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
}
//MARK: - setupView
extension ForecastTFHoursTableViewCell {
    private func setupViews() {
        contentView.addSubview(forecastTFHoursButton)
        contentView.addSubview(tFHoursCollectionView)
        
        NSLayoutConstraint.activate([
            forecastTFHoursButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33),
            forecastTFHoursButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            forecastTFHoursButton.heightAnchor.constraint(equalToConstant: 20),
            
            tFHoursCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tFHoursCollectionView.topAnchor.constraint(equalTo: forecastTFHoursButton.bottomAnchor, constant: 10),
            tFHoursCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tFHoursCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension ForecastTFHoursTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: - received 48h
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tFHoursCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ForecastTFHoursCollectionViewCell
        
        let hModel = model?.hourly[indexPath.item]
        let cModel = model?.current[0]
        
        let localOffset = TimeZone.current.secondsFromGMT()
        let timeOffset = (model?.timezoneOffset ?? 0) - localOffset
        
        let curTime = Double((cModel?.currentTime ?? 0) + timeOffset).dateFormatted("HH")
        let cellTime = Double((hModel?.hTime ?? 0) + timeOffset).dateFormatted("HH")
        let sunrise = Double((cModel?.sunrise ?? 0) + timeOffset).dateFormatted("HH")
        let sunset = Double((cModel?.sunset ?? 0) + timeOffset).dateFormatted("HH")

        if cellTime == curTime {
            cell.wrapperView.backgroundColor = UIColor(rgb: 0x204EC7)
            cell.tempLabel.textColor = .white
            cell.timeLabel.textColor = .white
        } else {
            cell.wrapperView.backgroundColor = nil
            cell.tempLabel.textColor = .black
            cell.timeLabel.textColor = .black
        }
        
            switch hModel?.hWeather[0].descript {
            case "clear sky":
                if cellTime > sunrise && cellTime <= sunset {
                cell.weatherImageView.image = UIImage(named: "sun")
                } else {
                cell.weatherImageView.image = UIImage(named: "moon")
                }
            case "scattered clouds":
                cell.weatherImageView.image = UIImage(named: "scatClouds")
            case "few clouds":
                if cellTime > sunrise && cellTime <= sunset {
                cell.weatherImageView.image = UIImage(named: "fewClouds")
                } else {
                cell.weatherImageView.image = UIImage(named: "scatClouds")
                }
            case "heavy intensity rain":
                cell.weatherImageView.image = UIImage(named: "heavyRain")
            case "moderate rain":
                cell.weatherImageView.image = UIImage(named: "rain")
            case "light rain":
                cell.weatherImageView.image = UIImage(named: "rain")
            case .none:
                cell.weatherImageView.image = UIImage(named: "scatClouds")
            case .some(_):
                cell.weatherImageView.image = UIImage(named: "scatClouds")
            }
        
        cell.timeLabel.text = "\(Double((hModel?.hTime ?? 0) + timeOffset).dateFormatted("HH:mm".toSetTimeUnits("short")))"
        cell.tempLabel.text = "\(Int((hModel?.hTemp ?? 0).rounded()).toSetTempUnits())"        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension ForecastTFHoursTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 42, height: 83)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


