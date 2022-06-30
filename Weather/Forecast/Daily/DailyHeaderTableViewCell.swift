//
//  DailyHeaderTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 29/6/2022.
//

import UIKit

class DailyHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DailyHeaderTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.textColor = UIColor(rgb: 0x272722)
        label.text = "Daily forecast"
        return label
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(16)
        label.textColor = UIColor(rgb: 0x272722)
        label.attributedText = "25 days".setUnderlineStyle()
        return label
    }()
}
//MARK: - setupViews
extension DailyHeaderTableViewCell {
    private func setupViews() {
        contentView.addSubview(titleLable)
        contentView.addSubview(rightLabel)
        
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLable.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLable.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            rightLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 43),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            rightLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        ])
    }
}
