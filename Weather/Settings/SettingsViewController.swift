//
//  SettingsViewController.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit

class SettingsViewController: UIViewController {
//MARK: - props
    
    private let settingsViewModel: SettingsViewModel
    private let settingsCellID = SettingsTableViewCell.cellId
    private let settingsHeaderID = SettingsHeaderView.cellId
    private let settingsFooterID = SettingsFooterView.cellId
//MARK: - subviews
    
    private let tableView = UITableView(frame: .zero, style: .plain)

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
        return UIImage.textToImage(drawText: unit, inImage: image , font: UIFont.setAppMainFont(16), color: UIColor(rgb: 0xE9EEFA), atPoint: CGPoint(x: 10, y: 5))
    }

}
//MARK: - setup views

extension SettingsViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
//        tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        tableView.layer.cornerRadius = 8
        tableView.separatorStyle = .none
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsCellID)
        tableView.register(SettingsHeaderView.self, forCellReuseIdentifier: settingsHeaderID)
        tableView.register(SettingsFooterView.self, forCellReuseIdentifier: settingsFooterID)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
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
            cell.valueLabel.text = settingsViewModel.settings[indexPath.row - 1].settingsName
            if cell.valueToggle.isOn {
                cell.valueToggle.thumbImage = setUnits(settingsViewModel.settings[indexPath.row - 1].settingsValueOff, UIImage(named: "switchOff") ?? UIImage())
            } else {
                cell.valueToggle.thumbImage = setUnits(settingsViewModel.settings[indexPath.row - 1].settingsValueOn, UIImage(named: "switchOn") ?? UIImage())
            }
//            tableView.reloadData()
            return cell
        }
        
        
//        cell.separatorInset = UIEdgeInsets
//        cell.layoutMargins = .zero
        
    }
    
    
}
//MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
}
