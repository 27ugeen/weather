//
//  CarouselCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 14/4/2022.
//

import UIKit

class CarouselEmptyCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let cellId = "CarouselEmptyCollectionViewCell"
    // MARK: - SubViews
    
    private lazy var addCityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemBlue.withAlphaComponent(0.7)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Add city", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.setTitleColor(.purple, for: .highlighted)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setups

private extension CarouselEmptyCollectionViewCell {
    func setupUI() {
//        backgroundColor = .white
        
        contentView.addSubview(addCityButton)
        
        let constraints = [
            addCityButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addCityButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addCityButton.widthAnchor.constraint(equalToConstant: 100),
            addCityButton.heightAnchor.constraint(equalToConstant: 42),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
// MARK: - Public

extension CarouselEmptyCollectionViewCell {
    public func configure(image: UIImage?, text: String) {
//        imageView.image = image
//        textLabel.text = text
    }
}

