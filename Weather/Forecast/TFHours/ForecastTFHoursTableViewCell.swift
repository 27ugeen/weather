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
    
    var model: ForecastModel?
    
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
            tFHoursCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //TODO: -
//            tFHoursCollectionView.heightAnchor.constraint(equalToConstant: 83)
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
        
        let m = model?.hourly[indexPath.item]
        let curTime = Double(model?.currentTime ?? 0).dateFormatted("HH")
        let cellTime = Double(m?.hTime ?? 0).dateFormatted("HH")
        let sunrise = Double(model?.sunrise ?? 0).dateFormatted("HH")
        let sunset = Double(model?.sunset ?? 0).dateFormatted("HH")

//
//        print("cur: \(curTime), cell: \(cellTime)")
//
        if cellTime == curTime {
            cell.wrapperView.backgroundColor = UIColor(rgb: 0x204EC7)
            cell.tempLabel.textColor = .white
            cell.timeLabel.textColor = .white
        } else {
            cell.wrapperView.backgroundColor = nil
            cell.tempLabel.textColor = .black
            cell.timeLabel.textColor = .black
        }
        
            switch m?.hWeather[0].descript {
            case "clear sky":
                if cellTime > sunrise && cellTime <= sunset {
                cell.weatherImageView.image = UIImage(named: "sun")
                } else {
                cell.weatherImageView.image = UIImage(named: "moon")
                }
            case "scattered clouds":
                cell.weatherImageView.image = UIImage(named: "scatClouds")
            case "few clouds":
                cell.weatherImageView.image = UIImage(named: "fewClouds")
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
        
        cell.timeLabel.text = "\(Double(m?.hTime ?? 0).dateFormatted("HH:mm"))"
        cell.tempLabel.text = "\(Int((m?.hTemp ?? 0).rounded()))"
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: - doesnt work... ???
//        let cell: ForecastTFHoursCollectionViewCell  = tFHoursCollectionView.cellForItem(at: indexPath) as! ForecastTFHoursCollectionViewCell
//
//        if cell.wrapperView.backgroundColor == nil {
//            cell.wrapperView.backgroundColor = .blue
//        } else {
//            cell.wrapperView.backgroundColor = nil
//        }
//        collectionView.reloadData()
//        print(cell.timeLabel.text)
    }
}


