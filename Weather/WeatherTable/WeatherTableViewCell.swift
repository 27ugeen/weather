//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 11/5/2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
//MARK: - props
    
    static let cellId = "WeatherTableViewCell"
    private let collectionCellID = WeatherPreviewCollectionViewCell.cellId
//MARK: - subviews
    
    private let titleLableView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x272722)
        label.attributedText = "Forecast for 24 hours".setUnderlineStyle()
        return label
    }()

    private lazy var weatherPreview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xE5E5E5)
        
        view.register(WeatherPreviewCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)

        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setupView

extension WeatherTableViewCell {
    private func setupViews() {
        contentView.addSubview(titleLableView)
        contentView.addSubview(weatherPreview)
        contentView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        
        NSLayoutConstraint.activate([
            titleLableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33),
            titleLableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLableView.heightAnchor.constraint(equalToConstant: 20),
            
            weatherPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weatherPreview.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10),
            weatherPreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            weatherPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            weatherPreview.widthAnchor.constraint(equalToConstant: 19),
            weatherPreview.heightAnchor.constraint(equalToConstant: 83)
        ])
    }
}
//MARK: - UICollectionViewDataSource

extension WeatherTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherPreview.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! WeatherPreviewCollectionViewCell
        return cell
    }
    
    
}
//MARK: - UICollectionViewDelegateFlowLayout

extension WeatherTableViewCell: UICollectionViewDelegateFlowLayout {
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


