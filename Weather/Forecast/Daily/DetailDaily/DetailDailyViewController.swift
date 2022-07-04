//
//  DetailDailyViewController.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DetailDailyViewController: UIViewController {
    //MARK: - props
    
    private let dateCellID = DateTableViewCell.cellId
    private let dayCellID = DetailDayTableViewCell.cellId
    private let nightCellID = DetailNightTableViewCell.cellId
    private let sunMoonCellID = SunMoonTableViewCell.cellId
    private let airQCellID = AirQTableViewCell.cellId
    
    var rowIdx = 0
    var model: ForecastModel? {
        didSet {
            tableView.reloadData()
        }
    }
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        
        setupViews()
    }
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
//MARK: - methods
    
//    private func goToDate(_ idx: Int) {
//        print("idx: \(idx)")
//        
//        
//    }
}
//MARK: - setupViews
extension DetailDailyViewController {
    private func setupViews() {
        view.addSubview(tableView)
        
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: dateCellID)
        tableView.register(DetailDayTableViewCell.self, forCellReuseIdentifier: dayCellID)
        tableView.register(DetailNightTableViewCell.self, forCellReuseIdentifier: nightCellID)
        tableView.register(SunMoonTableViewCell.self, forCellReuseIdentifier: sunMoonCellID)
        tableView.register(AirQTableViewCell.self, forCellReuseIdentifier: airQCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension DetailDailyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateCell = tableView.dequeueReusableCell(withIdentifier: dateCellID) as! DateTableViewCell
        let dayCell = tableView.dequeueReusableCell(withIdentifier: dayCellID) as! DetailDayTableViewCell
        let nightCell = tableView.dequeueReusableCell(withIdentifier: nightCellID) as! DetailNightTableViewCell
        let sunMoonCell = tableView.dequeueReusableCell(withIdentifier: sunMoonCellID) as! SunMoonTableViewCell
        let airQCell = tableView.dequeueReusableCell(withIdentifier: airQCellID) as! AirQTableViewCell
        
        switch indexPath.row {
        case 0:
            dateCell.model = self.model
            dateCell.rowIdx = self.rowIdx
            dateCell.goToToDayAction =  { idx in
                self.rowIdx = idx
                tableView.reloadData()
            }
            return dateCell
        case 1:
            dayCell.model = self.model
            dayCell.rowIdx = self.rowIdx
            return dayCell
        case 2:
            nightCell.model = self.model
            nightCell.rowIdx = self.rowIdx
            return nightCell
        case 3:
            sunMoonCell.model = self.model
            sunMoonCell.rowIdx = self.rowIdx
            return sunMoonCell
        case 4:
            return airQCell
        default:
            return airQCell
        }
    }
}
//MARK: - UITableViewDelegate
extension DetailDailyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 76
        case 1:
            return 357
        case 2:
            return 357
        case 3:
            return 153
        case 4:
            return 174
        default:
            return 174
        }
    }
}
