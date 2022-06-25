//
//  DetailTFHoursViewController.swift
//  Weather
//
//  Created by GiN Eugene on 25/6/2022.
//

import UIKit

class DetailTFHoursViewController: UIViewController {
    //MARK: - props
    private let headerID = DetailTFHoursHeaderView.cellId
    private let detailID = DetailTFHoursTableViewCell.cellId
    
//MARK: - subviews
    private let tableView: UITableView = {
        //TODO: - style?
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0xFFFFFF)
//        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = UIColor(rgb: 0x204EC7)
        return tableView
    }()
    
//MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        
        setupViews()
    }
}
//MARK: - setupViews
extension DetailTFHoursViewController {
    private func setupViews() {
        view.addSubview(tableView)
        
        tableView.register(DetailTFHoursHeaderView.self, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(DetailTFHoursTableViewCell.self, forCellReuseIdentifier: detailID)
//        tableView.register(ForecastTFHoursTableViewCell.self, forCellReuseIdentifier: tFHoursID)
//        tableView.register(ForecastDailyTableViewCell.self, forCellReuseIdentifier: dailyID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension DetailTFHoursViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            cell.layoutMargins = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: detailID, for: indexPath) as! DetailTFHoursTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! DetailTFHoursHeaderView
        return header
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Forecast for 24 hours"
//    }
}

//MARK: - UITableViewDelegate
extension DetailTFHoursViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 185
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    return "teeeeeeeeeeeeeest"
//    }
}
