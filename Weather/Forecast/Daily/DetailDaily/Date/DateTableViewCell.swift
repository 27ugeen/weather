//
//  DateTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 27/6/2022.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DateTableViewCell"
    private let collectionCellID = DateCollectionViewCell.cellId
    
    var goToToDayAction: ((Int) -> Void)?
    
    var rowIdx = 0
    var model: ForecastStub? {
        didSet {
            dateCollectionView.reloadData()
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
    
    private lazy var dateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        view.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    //MARK: - methods
    
    @objc private func dateBtnTapped(_ sender: UIButton) {
        self.goToToDayAction?(sender.tag)
    }
}
//MARK: - setupView

extension DateTableViewCell {
    private func setupViews() {
        contentView.addSubview(dateCollectionView)
        
        NSLayoutConstraint.activate([
            dateCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension DateTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.daily.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dateCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! DateCollectionViewCell
        let day = "\(Double(model?.daily[indexPath.row].dTime ?? 0).dateFormatted("dd/MM EE"))"
        
        cell.dateButton.setTitle(day, for: .normal)
        cell.dateButton.tag = indexPath.row
        cell.dateButton.addTarget(self, action: #selector(dateBtnTapped), for: .touchUpInside)
        
        if indexPath.row == rowIdx {
            cell.dateButton.backgroundColor = UIColor(rgb: 0x204EC7)
            cell.dateButton.setTitleColor(.white, for: .normal)
        } else {
            cell.dateButton.backgroundColor = UIColor(rgb: 0xFFFFFF)
            cell.dateButton.setTitleColor(.black, for: .normal)
        }
        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension DateTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
}
