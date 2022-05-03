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
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
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
    
}
//MARK: - setup views

extension SettingsViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0xE9EEFA)
        tableView.layer.cornerRadius = 8
        tableView.separatorStyle = .none
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsCellID)
//        tableView.register(SettingsHeaderView.self, forCellReuseIdentifier: settingsHeaderID)
//        tableView.register(SettingsFooterView.self, forCellReuseIdentifier: settingsFooterID)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 330)
        ])
    }
}
//MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellID, for: indexPath) as! SettingsTableViewCell
        return cell
    }
}
//MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
}
