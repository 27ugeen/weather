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
    private let collectionCellID = ForecastDailyCollectionViewCell.cellId
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let titleLableView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.textColor = UIColor(rgb: 0x272722)
        label.text = "Daily forecast"
        return label
    }()

    private lazy var dailyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        view.register(ForecastDailyCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)

        view.dataSource = self
        view.delegate = self
        
        return view
    }()
}

extension ForecastDailyTableViewCell {
    private func setupViews() {
        contentView.addSubview(titleLableView)
        contentView.addSubview(dailyCollectionView)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleLableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLableView.heightAnchor.constraint(equalToConstant: 22),
            
            dailyCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dailyCollectionView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10),
            dailyCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dailyCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            dailyCollectionView.widthAnchor.constraint(equalToConstant: 340),
            dailyCollectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
//MARK: - UICollectionViewDataSource

extension ForecastDailyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dailyCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ForecastDailyCollectionViewCell
        return cell
    }
    
    
}
//MARK: - UICollectionViewDelegateFlowLayout

extension ForecastDailyTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: - cell width?
        let cellWidth = UIScreen.main.bounds.width - 32
//        print(cellWidth)
        return CGSize(width: cellWidth, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
