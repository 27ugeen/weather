//
//  MenuToggleTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 28/6/2022.
//

import UIKit
import CustomUISwitch

class MenuToggleTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "MenuToggleTableViewCell"
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "thermometer")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xFFFFFF)
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Temperature unit"
        label.textColor = UIColor(rgb: 0xFDFAFA)
        return label
    }()
    
    private let valueToggle: CustomSwitch = {
        let customSwitch = CustomSwitch()
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        customSwitch.onTintColor = .systemGreen
        customSwitch.offTintColor = UIColor(rgb: 0x6B6767)
        customSwitch.cornerRadius = 20
        customSwitch.thumbCornerRadius = 7.5
        customSwitch.thumbShadowOffset = CGSize(width: 0, height: 0)
        customSwitch.thumbSize = CGSize(width: 15, height: 15)
        customSwitch.animationDuration = 0.5
        
        customSwitch.isOn = false
        
        //        customSwitch.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return customSwitch
    }()
}
//MARK: - setupViews
extension MenuToggleTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0x204EC7)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(valueToggle)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 15),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 21),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            valueToggle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueToggle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29),
            valueToggle.widthAnchor.constraint(equalToConstant: 30),
            valueToggle.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
}
