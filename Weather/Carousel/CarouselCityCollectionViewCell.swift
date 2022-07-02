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
    var goToDailyDetailAction: (() -> Void)?
    
    var viewModel: ForecastViewModel?
    
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerID) as! ForecastHeaderTableViewCell
        let tFHCell = tableView.dequeueReusableCell(withIdentifier: tFHoursID) as! ForecastTFHoursTableViewCell
        let dailyHeaderCell = tableView.dequeueReusableCell(withIdentifier: dailyHeaderID) as! DailyHeaderTableViewCell
        let dailyCell = tableView.dequeueReusableCell(withIdentifier: dailyID) as! ForecastDailyTableViewCell
        
        switch indexPath.row {
        case 0:
            viewModel?.decodeModelFromData() { model in
                headerCell.presentTempLabel.text = "\(Int(model.temp))°"
//                headerCell.dailyTempLabel.text = "\(Int(model.tempMin))°/\( Int(model.tempMax))°"
                headerCell.cloudinessLabel.text = "\(model.clouds)"
                headerCell.windSpeedLabel.text = "\(Int(model.windSpeed.rounded()))m/s"
                headerCell.humidityLabel.text = "\(model.humidity)%"
                headerCell.weatherDescriptLabel.text = model.weather[0].descript
                headerCell.currentDateLabel.text = Double(model.currentTime).toDate()
                headerCell.sunriseLabel.text = Double(model.sunrise).toTime()
                headerCell.sunsetLabel.text = Double(model.sunset).toTime()
            }
            return headerCell
        case 1:
            tFHCell.forecastTFHoursButton.addTarget(self, action: #selector(forecastTFHoursTupped), for: .touchUpInside)
            return tFHCell
        case 2:
            return dailyHeaderCell
        default:
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
            self.goToDailyDetailAction?()
        }
    }
}
