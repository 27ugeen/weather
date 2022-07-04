//
//  DetailDailyTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DetailDayTableViewCell: UITableViewCell {
    //MARK: - props
    
    static let cellId = "DetailDayTableViewCell"
    
    private let headCellID = DayHeadTableViewCell.cellId
    private let ordinaryCellID = DayOrdinaryTableViewCell.cellId
    
    var rowIdx = 0
    var model: ForecastModel? {
        didSet {
            tableView.reloadData()
        }
    }
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
extension DetailDayTableViewCell {
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
extension DetailDayTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headCell = tableView.dequeueReusableCell(withIdentifier: headCellID) as! DayHeadTableViewCell
        let defCell = tableView.dequeueReusableCell(withIdentifier: ordinaryCellID) as! DayOrdinaryTableViewCell
        
        let m = model?.daily[rowIdx]
        
        switch m?.dWeather[0].descript {
        case "clear sky":
            headCell.weatherImageView.image = UIImage(named: "sun")
        case "scattered clouds":
            headCell.weatherImageView.image = UIImage(named: "scatClouds")
        case "few clouds":
            headCell.weatherImageView.image = UIImage(named: "fewClouds")
        case "heavy intensity rain":
            headCell.weatherImageView.image = UIImage(named: "heavyRain")
        case "moderate rain":
            headCell.weatherImageView.image = UIImage(named: "rain")
        case "light rain":
            headCell.weatherImageView.image = UIImage(named: "rain")
        case .none:
            headCell.weatherImageView.image = UIImage(named: "scatClouds")
        case .some(_):
            headCell.weatherImageView.image = UIImage(named: "scatClouds")
        }
        
        switch indexPath.row {
        case 0:
            headCell.dayLabel.text = "Day"
            headCell.tempLabel.text = "\(Int(m?.dTempDay.rounded() ?? 0))"
            headCell.mainForecastLabel.text = "\(m?.dWeather[0].descript ?? "clear")"
            headCell.tempFieelsValueLabel.text = "\(Int(m?.dFeelsTemp.rounded() ?? 0))"
            return headCell
        case 1:
            defCell.weatherImageView.image = UIImage(named: "windSpeed")
            defCell.weatherCompLabel.text = "Wind"
            defCell.weatherCompValueLabel.text = "\(Int(m?.dWindSpeed.rounded() ?? 0))m/s, \(Double(m?.dWindDeg ?? 0).direction)"
            return defCell
        case 2:
            defCell.weatherImageView.image = UIImage(named: "sun")
            defCell.weatherCompLabel.text = "UV Index"
            defCell.weatherCompValueLabel.text = "\(Int(m?.dUVI ?? 0)) \(Int(m?.dUVI ?? 0).uviToStr())"
            return defCell
        case 3:
            defCell.weatherImageView.image = UIImage(named: "rain")
            defCell.weatherCompLabel.text = "Rain"
            defCell.weatherCompValueLabel.text = "\(Int((m?.dPop ?? 0) * 100))%"
            return defCell
        case 4:
            defCell.weatherImageView.image = UIImage(named: "cloud")
            defCell.weatherCompLabel.text = "Cloudiness"
            defCell.weatherCompValueLabel.text = "\(m?.dClouds ?? 0)%"
            return defCell
        case 5:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(rgb: 0xE9EEFA)
            return cell
        default:
            return defCell
        }
    }
}
//MARK: - UITableViewDelegate
extension DetailDayTableViewCell: UITableViewDelegate {
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
