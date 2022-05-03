//
//  SettingsTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
//MARK: - props
    
    static let cellId = "SettingsTableViewCell"
//MARK: - subviews
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
//        label.text = "test"
        return label
    }()
    
    private let valueToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
//        toggle.isOn = UserDefaults.standard.bool(forKey: "toggle")
        
        toggle.onTintColor = UIColor(rgb: 0x1F4DC5)
        return toggle
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
//MARK: - setup views

extension SettingsTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        contentView.addSubview(valueLabel)
        contentView.addSubview(valueToggle)
        
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            valueToggle.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor),
            valueToggle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueToggle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
    }
}
