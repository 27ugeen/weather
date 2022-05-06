//
//  SettingsHeaderView.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class SettingsHeaderView: UITableViewCell {
//MARK: - props
    
    static let cellId = "SettingsHeaderView"
    //MARK: - subviews
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Настройки"
        label.textColor = UIColor(rgb: 0x272722)
        label.font = UIFont.setAppMainFont(18)
        label.numberOfLines = 0
        return label
    }()
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}
//MARK: - setupViews

extension SettingsHeaderView {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
}
