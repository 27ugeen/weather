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
    
//    private let titleLableView: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.setAppMainFont(18)
//        label.textColor = UIColor(rgb: 0x272722)
//        label.text = "Daily forecast"
//        return label
//    }()

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
    
    private let chevronRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor(rgb: 0x000000)
        return imageView
    }()
    
//    private lazy var dailyCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.showsVerticalScrollIndicator = false
//        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
//
//        view.register(ForecastDailyCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
//
//        view.dataSource = self
//        view.delegate = self
//
//        return view
//    }()
}
//MARK: - setupViews
extension ForecastDailyTableViewCell {
    private func setupViews() {
        contentView.addSubview(wrapperView)
        
        wrapperView.addSubview(dateLabel)
        wrapperView.addSubview(weatherImageView)
        wrapperView.addSubview(humidityLabel)
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
            
            humidityLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 5),
            humidityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            
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
//MARK: - UICollectionViewDataSource
//extension ForecastDailyTableViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 24
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dailyCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ForecastDailyCollectionViewCell
//        return cell
//    }
//}
//MARK: - UICollectionViewDelegateFlowLayout
//extension ForecastDailyTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = UIScreen.main.bounds.width - 32
//        return CGSize(width: cellWidth, height: 56)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//
//    }
//}
