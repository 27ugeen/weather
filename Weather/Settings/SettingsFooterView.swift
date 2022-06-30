//
//  SettingsFooterView.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class SettingsFooterView: UITableViewCell {
    //MARK: - props
    
    static let cellId = "SettingsFooterView"
    //MARK: - subviews
    
    private lazy var setButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.backgroundColor = UIColor(rgb: 0xF26E11)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        return button
    }()
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    //MARK: - methods

    @objc private func buttonTapped() {
        setButton.setBackgroundColor(UIColor(rgb: 0xC65607), forState: .highlighted)
    }
}
//MARK: - setupViews

extension SettingsFooterView {
    private func setupViews() {
        contentView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        addSubview(setButton)
        
        NSLayoutConstraint.activate([
            setButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            setButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            setButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            setButton.heightAnchor.constraint(equalToConstant: 40),
            setButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -70)
        ])
    }
}
