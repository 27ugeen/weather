//
//  DetailDailyViewController.swift
//  Weather
//
//  Created by GiN Eugene on 26/6/2022.
//

import UIKit

class DetailDailyViewController: UIViewController {
    //MARK: - props

    private let tableCellID = DetailDailyTableViewCell.cellId
    
    //MARK: - init
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor(rgb: 0xFFFFFF)
            
            setupViews()
        }
    
//MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.automaticallyAdjustsScrollIndicatorInsets = false
//        tableView.contentInsetAdjustmentBehavior = .never
//        tableView.isScrollEnabled = false
        
        
//        tableView.backgroundColor = UIColor(rgb: 0xFFFFFF)
        tableView.separatorStyle = .none
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        tableView.separatorColor = UIColor(rgb: 0x204EC7)
        return tableView
    }()
    
    private let sunMoonLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(18)
        label.text = "Sun & Moon"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    private let moonLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = UIColor(rgb: 0x204EC7).cgColor
        label.layer.cornerRadius = 15
        return label
    }()
    
    private let moonPhaseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.setAppMainFont(14)
        label.text = "Full Moon"
        label.textColor = UIColor(rgb: 0x272722)
        return label
    }()
    
    
}
//MARK: - setupViews
extension DetailDailyViewController {
    private func setupViews() {
        view.addSubview(tableView)
//        view.addSubview(sunMoonLabel)
//        view.addSubview(moonLabel)
//        view.addSubview(moonPhaseLabel)
        
        
//        tableView.register(DetailTFHoursHeaderView.self, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(DetailDailyTableViewCell.self, forCellReuseIdentifier: tableCellID)
//        tableView.register(DayOrdinaryTableViewCell.self, forCellReuseIdentifier: ordinaryCellID)
//        tableView.register(ForecastDailyTableViewCell.self, forCellReuseIdentifier: dailyID)
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
//MARK: - UITableViewDataSource
extension DetailDailyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! DetailDailyTableViewCell
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DetailDailyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 357
    }
}
