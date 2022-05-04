//
//  SettingsViewController.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class SettingsViewController: UIViewController {
    //MARK: - subviews
    
    private let windowView: UIView = {
        let windowView = UIView()
        windowView.translatesAutoresizingMaskIntoConstraints = false
        windowView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        windowView.layer.cornerRadius = 8
        return windowView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Настройки"
        label.textColor = UIColor(rgb: 0x272722)
        label.font = UIFont.setAppMainFont(18)
        label.numberOfLines = 0
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Температура"
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Скорость ветра"
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let dateFormateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Формат времени"
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let notificationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Уведомления"
        label.textColor = UIColor(rgb: 0x898383)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let temperatureToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
//        toggle.isOn = UserDefaults.standard.bool(forKey: "toggle")
        
        toggle.onTintColor = UIColor(rgb: 0x1F4DC5)
        return toggle
    }()
    
    private let windSpeedToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
//        toggle.isOn = UserDefaults.standard.bool(forKey: "toggle")
        
        toggle.onTintColor = UIColor(rgb: 0x1F4DC5)
        return toggle
    }()
    
    private let dateFormateToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
//        toggle.isOn = UserDefaults.standard.bool(forKey: "toggle")
        
        toggle.onTintColor = UIColor(rgb: 0x1F4DC5)
        return toggle
    }()
    
    private let notificationsToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
//        toggle.isOn = UserDefaults.standard.bool(forKey: "toggle")
        
        toggle.onTintColor = UIColor(rgb: 0x1F4DC5)
        return toggle
    }()
    
    private let setButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Установить", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.backgroundColor = UIColor(rgb: 0xF26E11)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        //        self.addTarget(self, action: #selector(nil), for: .touchUpInside)
        
        return button
    }()
    //MARK: - loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}
//MARK: - setup views

extension SettingsViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        view.addSubview(windowView)
        
        windowView.addSubview(titleLabel)
        windowView.addSubview(temperatureLabel)
        windowView.addSubview(windSpeedLabel)
        windowView.addSubview(dateFormateLabel)
        windowView.addSubview(notificationsLabel)
        windowView.addSubview(temperatureToggle)
        windowView.addSubview(windSpeedToggle)
        windowView.addSubview(dateFormateToggle)
        windowView.addSubview(notificationsToggle)
        windowView.addSubview(setButton)

        
        NSLayoutConstraint.activate([
            windowView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            windowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            windowView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            titleLabel.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: windowView.topAnchor, constant: 27),
            
            temperatureLabel.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 20),
            temperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            windSpeedLabel.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 20),
            windSpeedLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 30),
            dateFormateLabel.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 20),
            dateFormateLabel.topAnchor.constraint(equalTo: windSpeedLabel.bottomAnchor, constant: 30),
            notificationsLabel.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 20),
            notificationsLabel.topAnchor.constraint(equalTo: dateFormateLabel.bottomAnchor, constant: 30),
            
            setButton.leadingAnchor.constraint(equalTo: windowView.leadingAnchor, constant: 35),
            setButton.topAnchor.constraint(equalTo: notificationsLabel.bottomAnchor, constant: 42),
            setButton.trailingAnchor.constraint(equalTo: windowView.trailingAnchor, constant: -35),
            setButton.bottomAnchor.constraint(equalTo: windowView.bottomAnchor, constant: -16),
            setButton.heightAnchor.constraint(equalToConstant: 40),
            
            temperatureToggle.topAnchor.constraint(equalTo: windowView.topAnchor, constant: 57),
            temperatureToggle.trailingAnchor.constraint(equalTo: windowView.trailingAnchor, constant: -30),
            windSpeedToggle.topAnchor.constraint(equalTo: temperatureToggle.bottomAnchor, constant: 20),
            windSpeedToggle.trailingAnchor.constraint(equalTo: windowView.trailingAnchor, constant: -30),
            dateFormateToggle.topAnchor.constraint(equalTo: windSpeedToggle.bottomAnchor, constant: 20),
            dateFormateToggle.trailingAnchor.constraint(equalTo: windowView.trailingAnchor, constant: -30),
            notificationsToggle.topAnchor.constraint(equalTo: dateFormateToggle.bottomAnchor, constant: 20),
            notificationsToggle.trailingAnchor.constraint(equalTo: windowView.trailingAnchor, constant: -30)
        ])
    }
}
