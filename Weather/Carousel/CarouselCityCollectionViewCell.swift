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
    
    private let headerID = CityMainHeaderTableViewCell.cellId
    private let collectionView = WeatherTableViewCell.cellId
    
    //MARK: - Subviews
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        tableView.separatorStyle = .none
        return tableView
    }()
    

//MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setupViews
extension CarouselCityCollectionViewCell {
    func setupViews() {
        contentView.addSubview(tableView)
        
        tableView.register(CityMainHeaderTableViewCell.self, forCellReuseIdentifier: headerID)
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: collectionView)
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: headerID, for: indexPath) as! CityMainHeaderTableViewCell
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionView, for: indexPath) as! WeatherTableViewCell
            return cell
        }
    }
    
    
}

//MARK: - UITableViewDelegate

extension CarouselCityCollectionViewCell: UITableViewDelegate {
    
}
