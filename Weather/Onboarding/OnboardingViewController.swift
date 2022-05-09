//
//  OnboardingViewController.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - subviews
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "onboardingImg")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let infoTopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Разрешить приложению  Weather использовать данные о местоположении вашего устройства"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xF8F5F5)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let infoMidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Чтобы получить более точные прогнозы погоды во время движения или путешествия"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.font = UIFont.setAppMainFont(14)
        return label
    }()
    
    private let infoBotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вы можете изменить свой выбор в любое время из меню приложения"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.font = UIFont.setAppMainFont(14)
        return label
    }()
    
    private let allowLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.backgroundColor = UIColor(rgb: 0xF26E11)
        button.titleLabel?.font = UIFont.setAppMainFont(12)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        //        self.addTarget(self, action: #selector(nil), for: .touchUpInside)
        
        return button
    }()
    
    private let denieLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFDFBF5), for: .normal)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
        
        //        self.addTarget(self, action: #selector(nil), for: .touchUpInside)
        
        return button
    }()
    
    
    
    //MARK: - loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}

//MARK: - setupViews

extension OnboardingViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(infoTopLabel)
        contentView.addSubview(infoMidLabel)
        contentView.addSubview(infoBotLabel)
        contentView.addSubview(allowLocationButton)
        contentView.addSubview(denieLocationButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 62),
            imageView.widthAnchor.constraint(equalToConstant: 334),
            imageView.heightAnchor.constraint(equalToConstant: 304),
            
            infoTopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoTopLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            infoTopLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            infoMidLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoMidLabel.topAnchor.constraint(equalTo: infoTopLabel.bottomAnchor, constant: 10),
            infoMidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            infoBotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoBotLabel.topAnchor.constraint(equalTo: infoMidLabel.bottomAnchor, constant: 10),
            infoBotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            allowLocationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            allowLocationButton.topAnchor.constraint(equalTo: infoBotLabel.bottomAnchor, constant: 40),
            allowLocationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            allowLocationButton.heightAnchor.constraint(equalToConstant: 40),
            
            denieLocationButton.topAnchor.constraint(equalTo: allowLocationButton.bottomAnchor, constant: 25),
            denieLocationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            denieLocationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -77)
        ])
    }
}
