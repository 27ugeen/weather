//
//  DateCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 27/6/2022.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    
    static let cellId = "DateCollectionViewCell"
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    lazy var dateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.setTitle("16/04 Fri", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
        return button
    }()
}
//MARK: - setupViews
extension DateCollectionViewCell {
    private func setupViews() {
        contentView.addSubview(dateButton)
        
        NSLayoutConstraint.activate([
            dateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
