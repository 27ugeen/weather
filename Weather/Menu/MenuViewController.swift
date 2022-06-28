//
//  MenuViewController.swift
//  Weather
//
//  Created by GiN Eugene on 28/6/2022.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: - props
    
    private let toggleCellID = MenuToggleTableViewCell.cellId
    private let ordinaryCellID = MenuOrdinaryTableViewCell.cellId
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        
        setupViews()
    }
    //MARK: - subviews
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "setTitleImg")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMediumFont(18)
        label.text = "Weather"
        label.textColor = UIColor(rgb: 0xFFFFFF)
        return label
    }()
    
    private let lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "lineS")
        return imageView
    }()
    
    private let editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "editing")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var editSettingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit settings", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.setAppMainFont(14)
        button.setTitleColor(UIColor(rgb: 0xFDFAFA), for: .normal)
        //        button.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let geoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "location")
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        //        imageView.image?.withTintColor(.white, renderingMode: .alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    private let geoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "City"
        label.textColor = UIColor(rgb: 0xFDFAFA)
        return label
    }()
    
    private let dottedLineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dottedLineS")
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0x204EC7)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
}
//MARK: - setupViews
extension MenuViewController {
    private func setupViews() {
        
        view.addSubview(titleImageView)
        view.addSubview(titleLabel)
        view.addSubview(lineImageView)
        view.addSubview(editImageView)
        view.addSubview(editSettingsButton)
        view.addSubview(geoImageView)
        view.addSubview(geoLabel)
        view.addSubview(dottedLineImageView)
        view.addSubview(tableView)
        
        tableView.register(MenuOrdinaryTableViewCell.self, forCellReuseIdentifier: ordinaryCellID)
        tableView.register(MenuToggleTableViewCell.self, forCellReuseIdentifier: toggleCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleImageView.widthAnchor.constraint(equalToConstant: 25),
            titleImageView.heightAnchor.constraint(equalTo: titleImageView.widthAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            lineImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            lineImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95),
            lineImageView.heightAnchor.constraint(equalToConstant: 1),
            
            editImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            editImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            editImageView.widthAnchor.constraint(equalToConstant: 25),
            editImageView.heightAnchor.constraint(equalTo: geoImageView.widthAnchor),
            
            editSettingsButton.leadingAnchor.constraint(equalTo: editImageView.trailingAnchor,constant: 16),
            editSettingsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            editSettingsButton.widthAnchor.constraint(equalToConstant: 100),
            editSettingsButton.heightAnchor.constraint(equalToConstant: 25),
            
            geoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            geoImageView.topAnchor.constraint(equalTo: editSettingsButton.bottomAnchor, constant: 20),
            geoImageView.widthAnchor.constraint(equalToConstant: 25),
            geoImageView.heightAnchor.constraint(equalTo: geoImageView.widthAnchor),
            
            geoLabel.leadingAnchor.constraint(equalTo: geoImageView.trailingAnchor, constant: 16),
            geoLabel.topAnchor.constraint(equalTo: editSettingsButton.bottomAnchor, constant: 26),
            
            dottedLineImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dottedLineImageView.topAnchor.constraint(equalTo: geoLabel.bottomAnchor, constant: 18),
            dottedLineImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.95),
            dottedLineImageView.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: dottedLineImageView.bottomAnchor, constant: 44),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ordinaryCell = tableView.dequeueReusableCell(withIdentifier: ordinaryCellID) as! MenuOrdinaryTableViewCell
        let toggleCell = tableView.dequeueReusableCell(withIdentifier: toggleCellID) as! MenuToggleTableViewCell
        
        switch indexPath.row {
        case 0:
            toggleCell.iconImageView.image = UIImage(named: "bell")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            toggleCell.nameLabel.text = "Notification"
            return toggleCell
        case 1:
            toggleCell.iconImageView.image = UIImage(named: "cloudSun")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            toggleCell.nameLabel.text = "Daytime Weather"
            return toggleCell
        case 2:
            ordinaryCell.iconImageView.image = UIImage(named: "thermometer")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            ordinaryCell.nameLabel.text = "Temperature unit"
            ordinaryCell.nameValueLabel.text = "C"
            return ordinaryCell
        case 3:
            ordinaryCell.iconImageView.image = UIImage(named: "fan")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            ordinaryCell.nameLabel.text = "Wind speed unit"
            ordinaryCell.nameValueLabel.text = "m/s"
            return ordinaryCell
        case 4:
            ordinaryCell.iconImageView.image = UIImage(named: "eye")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            ordinaryCell.nameLabel.text = "Visibility unit"
            ordinaryCell.nameValueLabel.text = "Km"
            return ordinaryCell
        case 5:
            ordinaryCell.iconImageView.image = UIImage(named: "clock")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            ordinaryCell.nameLabel.text = "Time format"
            ordinaryCell.nameValueLabel.text = "24H"
            return ordinaryCell
        case 6:
            ordinaryCell.iconImageView.image = UIImage(named: "calendar")?.withTintColor(.white, renderingMode: .alwaysTemplate)
            ordinaryCell.nameLabel.text = "Date format"
            ordinaryCell.nameValueLabel.text = "mm/dd/yy"
            return ordinaryCell
        default:
            return ordinaryCell
        }
    }
}
//MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
}
