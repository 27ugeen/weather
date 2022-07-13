//
//  DetailTFHoursHeaderView.swift
//  Weather
//
//  Created by GiN Eugene on 25/6/2022.
//

import UIKit

class DetailTFHoursHeaderView: UITableViewHeaderFooterView {
    //MARK: - props
    
    static let cellId = "DetailTFHoursHeaderView"
    private let collectionCellID = DetailTFHoursHeaderCollectionViewCell.cellId
    
    var model: ForecastStub?
    
    //MARK: - init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let titleLableView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.textColor = UIColor(rgb: 0x272722)
        label.text = "Forecast for 24 hours"
        return label
    }()
    
    private lazy var tFHoursCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xE9EEFA)
        
        view.register(DetailTFHoursHeaderCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
}
//MARK: - setupViews
extension DetailTFHoursHeaderView {
    private func setupViews() {
        contentView.addSubview(titleLableView)
        contentView.addSubview(tFHoursCollectionView)

        NSLayoutConstraint.activate([
            titleLableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            tFHoursCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tFHoursCollectionView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 15),
            tFHoursCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tFHoursCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension DetailTFHoursHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: - received 48h
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tFHoursCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! DetailTFHoursHeaderCollectionViewCell
        
        let m = model?.hourly[indexPath.item]
        
        cell.timeLabel.text = "\(Double(m?.hTime ?? 0).dateFormatted("HH:mm"))"
        cell.tempLabel.text = "\(Int((m?.hTemp ?? 0).rounded()).toSetTempUnits())"
        cell.precipitationLabel.text = "\(Int((m?.hPop ?? 0) * 100))%"
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension DetailTFHoursHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 54, height: 152)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 16, bottom: 8, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


