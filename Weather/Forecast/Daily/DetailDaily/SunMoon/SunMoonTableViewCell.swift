//
//  SunMoonTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class SunMoonTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "SunMoonTableViewCell"
    private let collectionCellID = SunMoonCollectionViewCell.cellId
    
    var rowIdx = 0
    var model: ForecastStub? {
        didSet {
            sunMoonCollectionView.reloadData()
        }
    }
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let sunMoonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "Sun & Moon"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let moonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(rgb: 0x204EC7).cgColor
        label.layer.cornerRadius = 7.5
        return label
    }()
    
    private let moonPhaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Full Moon"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private lazy var sunMoonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.isScrollEnabled = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        view.register(SunMoonCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    //MARK: - methods
    private func secToHHmm(_ max: Int, _ min: Int) -> String {
        var max = max
        var min = min
        
        if max == 0 { max = min }
        if min == 0 { min = max }
        
        var dHourLength = (max - min) / 3600
        var dMinuteLength = ((max - min) - dHourLength * 3600) / 60
        
        if dHourLength < 0 { dHourLength += 23 }
        if dMinuteLength < 0 { dMinuteLength += 60 }
        
        return "\(dHourLength)h \(dMinuteLength)m"
    }
}
//MARK: - setupView
extension SunMoonTableViewCell {
    private func setupViews() {
        contentView.addSubview(sunMoonLabel)
        contentView.addSubview(moonLabel)
        contentView.addSubview(moonPhaseLabel)
        contentView.addSubview(sunMoonCollectionView)
        
        NSLayoutConstraint.activate([
            sunMoonLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            sunMoonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            moonPhaseLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            moonPhaseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            moonLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            moonLabel.trailingAnchor.constraint(equalTo: moonPhaseLabel.leadingAnchor, constant: -5),
            moonLabel.widthAnchor.constraint(equalToConstant: 15),
            moonLabel.heightAnchor.constraint(equalTo: moonLabel.widthAnchor),
            
            sunMoonCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sunMoonCollectionView.topAnchor.constraint(equalTo: sunMoonLabel.bottomAnchor, constant: 15),
            sunMoonCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            sunMoonCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension SunMoonTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sunMoonCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! SunMoonCollectionViewCell
        
        let m = model?.daily[rowIdx]
        let dLength = self.secToHHmm((m?.dSunset ?? 0), (m?.dSunrise ?? 0))
        let nLength = self.secToHHmm((m?.dMoonset ?? 0), (m?.dMoonrise ?? 0))
        
        switch indexPath.item {
        case 0:
            cell.sunMoonImageView.image = UIImage(named: "sun")
            cell.sunriseLabel.text = "Sunrise"
            cell.sunsetLabel.text = "Sunset"
            cell.sunriseValueLabel.text = "\(Double(m?.dSunrise ?? 0).dateFormatted("HH:mm"))"
            cell.sunsetValueLabel.text = "\(Double(m?.dSunset ?? 0).dateFormatted("HH:mm"))"
            cell.dayLengthLabel.text = dLength
        case 1:
            cell.sunMoonImageView.image = UIImage(named: "moon")
            cell.sunriseLabel.text = "Moonrise"
            cell.sunsetLabel.text = "Moonset"
            cell.sunriseValueLabel.text = "\(Double(m?.dMoonrise ?? 0).dateFormatted("HH:mm"))"
            cell.sunsetValueLabel.text = "\(Double(m?.dMoonset ?? 0).dateFormatted("HH:mm"))"
            cell.dayLengthLabel.text = "\(nLength)"
        default:
            break
        }
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension SunMoonTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width/2 - 32
        return CGSize(width: cellWidth, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
