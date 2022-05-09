//
//  SettingsTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit
import CustomUISwitch

class SettingsTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "SettingsTableViewCell"
    private lazy var switchOnImageWithTitle = UIImage.textToImage(drawText: valueToggle.labelOn.text ?? "On", inImage: UIImage(named: "switchOn") ?? UIImage(), font: UIFont.setAppMainFont(16), color: UIColor(rgb: 0xE9EEFA), atPoint: CGPoint(x: 10, y: 5))
    private lazy var switchOffImgWithTitle = UIImage.textToImage(drawText: valueToggle.labelOff.text ?? "Off", inImage: UIImage(named: "switchOff") ?? UIImage(), font: UIFont.setAppMainFont(16), color: UIColor(rgb: 0xE9EEFA), atPoint: CGPoint(x: 10, y: 5))
    //MARK: - subviews
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    let valueToggle: CustomSwitch = {
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        customSwitch.onTintColor = UIColor(rgb: 0xFEEDE9)
        customSwitch.offTintColor = customSwitch.onTintColor
        customSwitch.cornerRadius = 0.15
        customSwitch.thumbCornerRadius = 0.15
        customSwitch.thumbShadowOffset = CGSize(width: 0, height: 0)
        
        customSwitch.areLabelsShown = true
        customSwitch.labelOn.textColor = UIColor(rgb: 0x272722)
        customSwitch.labelOff.textColor = customSwitch.labelOn.textColor
        
        customSwitch.labelOn.font = UIFont.setAppMainFont(16)
        customSwitch.labelOff.font = customSwitch.labelOn.font
        customSwitch.thumbSize = CGSize(width: 40, height: 30)
        customSwitch.animationDuration = 0.5
        
        customSwitch.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return customSwitch
    }()
    
    @objc private func buttonClicked(_ sender: Any) {
        if valueToggle.isOn {
            valueToggle.thumbImage = switchOffImgWithTitle
        } else {
            valueToggle.thumbImage = switchOnImageWithTitle
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
            valueToggle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            valueToggle.widthAnchor.constraint(equalToConstant: 80),
            valueToggle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
