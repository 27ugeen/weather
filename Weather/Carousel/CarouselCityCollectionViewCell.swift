//
//  CarouselCityCollectionViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 15/4/2022.
//

import UIKit

class CarouselCityCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let cellId = "CarouselCityCollectionViewCell"
    
    private let headerID = ForecastHeaderTableViewCell.cellId
    private let tFHoursID = ForecastTFHoursTableViewCell.cellId
    private let dailyHeaderID = DailyHeaderTableViewCell.cellId
    private let dailyID = ForecastDailyTableViewCell.cellId
    
    var goToTFHDetailAction: (() -> Void)?
    var goToDailyDetailAction: ((Int) -> Void)?
    
    var model: ForecastModel? {
        didSet{
            tableView.reloadData()
        }
    }
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Subviews
    
    private let tableView: UITableView = {
        //TODO: - style?
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - methods
    
    @objc private func forecastTFHoursTupped() {
        self.goToTFHDetailAction?()
    }
}
//MARK: - setupViews
extension CarouselCityCollectionViewCell {
    func setupViews() {
        contentView.addSubview(tableView)
        
        tableView.register(ForecastHeaderTableViewCell.self, forCellReuseIdentifier: headerID)
        tableView.register(ForecastTFHoursTableViewCell.self, forCellReuseIdentifier: tFHoursID)
        tableView.register(DailyHeaderTableViewCell.self, forCellReuseIdentifier: dailyHeaderID)
        tableView.register(ForecastDailyTableViewCell.self, forCellReuseIdentifier: dailyID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
//MARK: - UITableViewDataSource

extension CarouselCityCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: 7-25 days
        return (model?.daily.count ?? 0) + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerID) as! ForecastHeaderTableViewCell
        let tFHCell = tableView.dequeueReusableCell(withIdentifier: tFHoursID) as! ForecastTFHoursTableViewCell
        let dailyHeaderCell = tableView.dequeueReusableCell(withIdentifier: dailyHeaderID) as! DailyHeaderTableViewCell
        let dailyCell = tableView.dequeueReusableCell(withIdentifier: dailyID) as! ForecastDailyTableViewCell
        
        switch indexPath.row {
        case 0:
            headerCell.presentTempLabel.text = "\(Int(model?.temp ?? 0))°"
            headerCell.dailyTempLabel.text = "\(Int(model?.daily[0].dTempMin ?? 0))°/\( Int(model?.daily[0].dTempMax ?? 0))°"
            headerCell.cloudinessLabel.text = "\(model?.clouds ?? 0)"
            headerCell.windSpeedLabel.text = "\(Int(model?.windSpeed.rounded() ?? 0))m/s"
            headerCell.humidityLabel.text = "\(model?.humidity ?? 0)%"
            headerCell.weatherDescriptLabel.text = model?.weather[0].descript
            headerCell.currentDateLabel.text = Double(model?.currentTime ?? 0).dateFormatted("HH:mm, EE d MMMM")
            headerCell.sunriseLabel.text = Double(model?.sunrise ?? 0).dateFormatted("HH:mm")
            headerCell.sunsetLabel.text = Double(model?.sunset ?? 0).dateFormatted("HH:mm")
            return headerCell
        case 1:
            tFHCell.forecastTFHoursButton.addTarget(self, action: #selector(forecastTFHoursTupped), for: .touchUpInside)
            return tFHCell
        case 2:
            return dailyHeaderCell
        default:
            let idx = indexPath.row - 3
            let m = model?.daily[idx]
            
            dailyCell.dateLabel.text = "\(Double(m?.dTime ?? 0).dateFormatted("dd/MM"))"
            dailyCell.mainForecastLabel.text = "\(m?.dWeather[0].descript ?? "")"
            dailyCell.popLabel.text = "\(Int((m?.dPop ?? 0) * 100))%"
            dailyCell.dailyTempRangeLabel.text = "\(Int(m?.dTempMin.rounded() ?? 0))°-\(Int(m?.dTempMax.rounded() ?? 0))°"
            return dailyCell
        }
    }
}

//MARK: - UITableViewDelegate
extension CarouselCityCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 212
        case 1:
            return 158
        case 2:
            return 63
        default:
            return 66
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 2 {
            self.goToDailyDetailAction?(indexPath.row - 3)
        }
    }
}
