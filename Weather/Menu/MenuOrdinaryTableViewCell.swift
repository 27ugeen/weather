//
//  MenuSettingsTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 28/6/2022.
//

import UIKit

class MenuOrdinaryTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "MenuOrdinaryTableViewCell"
    
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
    
    let nameValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.attributedText = "C".setUnderlineStyle()
        label.textColor = UIColor(rgb: 0xEEF4F8)
        return label
    }()
    
}
//MARK: - setupViews
extension MenuOrdinaryTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0x204EC7)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameValueLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 15),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 21),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameValueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29)
        ])
    }
}
