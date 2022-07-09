//
//  CarouselCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 14/4/2022.
//

import UIKit

class CarouselEmptyCollectionViewCell: UICollectionViewCell {
    // MARK: - props
    
    static let cellId = "CarouselEmptyCollectionViewCell"
    
    var addCityAction: (() -> Void)?
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - subViews
    
    private lazy var addCityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Add city", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemGray , for: .highlighted)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - methods
    @objc private func btnTapped() {
        self.addCityAction?()
    }
}

//MARK: - setup
private extension CarouselEmptyCollectionViewCell {
    func setupUI() {
        contentView.addSubview(addCityButton)
        contentView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        let constraints = [
            addCityButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addCityButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addCityButton.widthAnchor.constraint(equalToConstant: 100),
            addCityButton.heightAnchor.constraint(equalToConstant: 42),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

