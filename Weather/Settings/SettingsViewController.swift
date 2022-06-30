//
//  SettingsViewController.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit
import CustomUISwitch

class SettingsViewController: UIViewController {
    //MARK: - props
    
    private let settingsViewModel: SettingsViewModel
    private let settingsCellID = SettingsTableViewCell.cellId
    private let settingsHeaderID = SettingsHeaderView.cellId
    private let settingsFooterID = SettingsFooterView.cellId
    //MARK: - subviews
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let topCloudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudSetTop")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xE9EEFA)
        return imageView
    }()
    
    private let midCloudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudSetMid")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xE9EEFA)
        return imageView
    }()
    
    private let botCloudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloudSetBot")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0xE9EEFA)
        return imageView
    }()
    
    //MARK: - init
    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    //MARK: - methods
    
    private func setUnits(_ unit: String, _ image: UIImage) -> UIImage {
        return  UIImage.textToImage(drawText: unit, inImage: image, font: UIFont.setAppMainFont(16), color: UIColor(rgb: 0xE9EEFA), atPoint: CGPoint(x: 10, y: 5))
    }
    
    @objc func toggleChanged(sender: CustomSwitch) {
        let btnIdx = sender.tag
        
        if UserDefaults.standard.bool(forKey: settingsViewModel.settings[btnIdx].settingsName) {
            UserDefaults.standard.set(false, forKey: settingsViewModel.settings[btnIdx].settingsName)
        } else {
            UserDefaults.standard.set(true, forKey: settingsViewModel.settings[btnIdx].settingsName)
        }
    }
}
//MARK: - setup views

extension SettingsViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        
        view.addSubview(topCloudImageView)
        view.addSubview(midCloudImageView)
        view.addSubview(botCloudImageView)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        tableView.layer.cornerRadius = 8
        tableView.separatorStyle = .none
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsCellID)
        tableView.register(SettingsHeaderView.self, forCellReuseIdentifier: settingsHeaderID)
        tableView.register(SettingsFooterView.self, forCellReuseIdentifier: settingsFooterID)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            topCloudImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topCloudImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            topCloudImageView.widthAnchor.constraint(equalToConstant: 246),
            topCloudImageView.heightAnchor.constraint(equalToConstant: 59),
            
            midCloudImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 121),
            midCloudImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            midCloudImageView.widthAnchor.constraint(equalToConstant: 180),
            midCloudImageView.heightAnchor.constraint(equalToConstant: 95),
            
            botCloudImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            botCloudImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
            botCloudImageView.widthAnchor.constraint(equalToConstant: 217),
            botCloudImageView.heightAnchor.constraint(equalToConstant: 66),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 330)
        ])
    }
}
//MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.settings.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: settingsHeaderID, for: indexPath) as! SettingsHeaderView
            return cell
        case settingsViewModel.settings.count + 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: settingsFooterID, for: indexPath) as! SettingsFooterView
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellID, for: indexPath) as! SettingsTableViewCell
            let cellIdxPath = indexPath.row - 1
            
            cell.valueLabel.text = settingsViewModel.settings[cellIdxPath].settingsName
            
            cell.valueToggle.isOn = UserDefaults.standard.bool(forKey: settingsViewModel.settings[cellIdxPath].settingsName)
            
            if cell.valueToggle.isOn {
                cell.valueToggle.thumbImage = setUnits(settingsViewModel.settings[cellIdxPath].settingsValueOff, UIImage(named: "switchOff") ?? UIImage())
            } else {
                cell.valueToggle.thumbImage = setUnits(settingsViewModel.settings[cellIdxPath].settingsValueOn, UIImage(named: "switchOn") ?? UIImage())
            }
            
            cell.valueToggle.tag = cellIdxPath
            cell.valueToggle.addTarget(self, action: #selector(toggleChanged), for: .touchUpInside)
            cell.valueToggle.labelOn.text = settingsViewModel.settings[cellIdxPath].settingsValueOn
            cell.valueToggle.labelOff.text = settingsViewModel.settings[cellIdxPath].settingsValueOff
            return cell
        }
    }
}
//MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
