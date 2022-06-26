//
//  DetailDailyTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DetailDailyTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DetailDailyTableViewCell"
    
    private let headCellID = DayHeadTableViewCell.cellId
    private let ordinaryCellID = DayOrdinaryTableViewCell.cellId
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = UIColor(rgb: 0x204EC7)
        return tableView
    }()
}
//MARK: - setupViews
extension DetailDailyTableViewCell {
    private func setupViews() {
        contentView.addSubview(tableView)
        
        tableView.register(DayHeadTableViewCell.self, forCellReuseIdentifier: headCellID)
        tableView.register(DayOrdinaryTableViewCell.self, forCellReuseIdentifier: ordinaryCellID)
        
        tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension DetailDailyTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: ordinaryCellID) as! DayOrdinaryTableViewCell
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: headCellID) as! DayHeadTableViewCell
            return cell
        case 1:
            defaultCell.weatherImageView.image = UIImage(named: "windSpeed")
            defaultCell.weatherCompLabel.text = "Wind"
            defaultCell.weatherCompValueLabel.text = "5 m/s, WSW"
            return defaultCell
        case 2:
            let cell = defaultCell
            cell.weatherImageView.image = UIImage(named: "sun")
            cell.weatherCompLabel.text = "UV Index"
            cell.weatherCompValueLabel.text = "2 Low"
            return cell
        case 3:
            let cell = defaultCell
            cell.weatherImageView.image = UIImage(named: "rain")
            cell.weatherCompLabel.text = "Rain"
            cell.weatherCompValueLabel.text = "55%"
            return cell
        case 4:
            let cell = defaultCell
            cell.weatherImageView.image = UIImage(named: "cloud")
            cell.weatherCompLabel.text = "Cloudness"
            cell.weatherCompValueLabel.text = "72%"
            return cell
        case 5:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(rgb: 0xE9EEFA)
            return cell
        default:
            return defaultCell
        }
    }
}
//MARK: - UITableViewDelegate
extension DetailDailyTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 145
        case 5:
            return 12
        default:
            return 46
        }
    }
}
