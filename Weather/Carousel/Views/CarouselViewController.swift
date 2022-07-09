//
//  ViewController.swift
//  Weather
//
//  Created by GiN Eugene on 12/4/2022.
//

import UIKit
import CoreLocation

class CarouselViewController: UIViewController {
    //MARK: - props
    
    private let emptyCellID = CarouselEmptyCollectionViewCell.cellId
    private let cityCellId = CarouselCityCollectionViewCell.cellId
    
    private var isStatusOn = UserDefaults.standard.bool(forKey: "isStatusOn")
    
    let dataModel: ForecastDataModel
    let viewModel: CarouselViewModel
    
    var cityModels: [ForecastStub] = [] {
        didSet {
            carouselCollectionView.reloadData()
        }
    }
    
    private var pageTitle: [String] = [] {
        didSet {
            self.title = pageTitle[currentPage]
        }
    }
    private var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    //MARK: - init
    
    init(dataModel: ForecastDataModel, viewModel: CarouselViewModel) {
        self.dataModel = dataModel
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xFFFFFF)
        navigationController?.navigationBar.tintColor = .black
        
        fetchData()
        setupNuvButtons()
        setupViews()
    }
    //MARK: - Subviews
    
    private lazy var carouselCollectionView: UICollectionView = {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: carouselLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundStyle = .automatic
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        
        return pageControl
    }()
    
    //MARK: - methods
    
    private func setPagesTitle(_ cities: [ForecastStub]) {
        for (_, city) in cities.enumerated() {
                dataModel.takeCityFromLoc(CLLocationCoordinate2D(latitude: city.lat , longitude: city.lon)) { model in
                    self.pageTitle.append("\(model.name), \(model.country.toCountry())")
            }
        }
    }
    
    private func fetchData() {
        if isStatusOn {
            //TODO: - need to take out this logic
            lazy var locationManager = CLLocationManager()
            
            self.viewModel.getAllForecastFromDB() { forecasts in
                if forecasts.isEmpty {
                    let group = DispatchGroup()
                    group.enter()
                    self.dataModel.decodeModelFromData(locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) { data in
                        
                        print("data from didload: \(data)")
                        self.dataModel.takeCityFromLoc(CLLocationCoordinate2D(latitude: data.lat, longitude: data.lon)) { model in
                            self.pageTitle.append("\(model.name), \(model.country.toCountry())")
                            group.leave()
                        }
                        group.enter()
                        DataBaseManager.shared.addForecastToDB(data)
                        group.leave()
                    }
                    group.notify(queue: .main) {
                        self.viewModel.getAllForecastFromDB() { forecasts in
                            self.cityModels = forecasts
                            self.setPagesTitle(forecasts)
                        }
                    }
                } else {
                    self.cityModels = forecasts
                    self.setPagesTitle(forecasts)
                }
            }
        }
    }
    
    private func goToTFHDetailPage(_ pageIdx: Int) {
        let detailTFHVC = DetailTFHoursViewController()
        detailTFHVC.model = self.viewModel.forecasts[pageIdx]
        navigationController?.pushViewController(detailTFHVC, animated: true)
    }
    
    private func goToDailyDetailPage(_ index: Int, _ pageIdx: Int) {
        let detailDailyVC = DetailDailyViewController()
        detailDailyVC.model = self.viewModel.forecasts[pageIdx]
        detailDailyVC.rowIdx = index
        navigationController?.pushViewController(detailDailyVC, animated: true)
    }
    
    private func addCity(completition: @escaping () -> Void) {
        let alertVC = UIAlertController(title: "Enter City", message: "Please, enter a name of the city", preferredStyle: .alert)
        alertVC.addTextField { tf in
            tf.placeholder = " City name..."
            
        }
        let actionOk = UIAlertAction(title: "OK", style: .default) { _ in
            let textField = alertVC.textFields?.first
            
            if let uText = textField?.text {
                if !self.isStatusOn {
                    //TODO: - UserDefaults doesn't work for reload - why??
                    UserDefaults.standard.set(true, forKey: "isStatusOn")
                    self.isStatusOn = true
                }
                
                self.dataModel.takeLocFromName(uText) { city in
                    self.viewModel.addForecastToDB(CLLocationCoordinate2D(latitude: city[0].lat, longitude: city[0].lon)) { model in
                        self.viewModel.createCurrentForecastStub(model) { forecast in
                            self.cityModels.append(forecast)
                            self.pageTitle.append("\(city[0].name), \(city[0].country.toCountry())")
                        }
                    }
                }
            }
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alertVC.dismiss(animated: true)
        }
        alertVC.addAction(actionOk)
        alertVC.addAction(actionCancel)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @objc private func leftBtnTupped() {
        let settingsVC = SettingsViewController(settingsViewModel: SettingsViewModel().self)
        navigationController?.pushVCFromLeft(controller: settingsVC)
    }
    
    @objc private func rightBtnTapped() {
        self.addCity() {}
    }
}
//MARK: - setupNuvButtons
extension CarouselViewController {
    private func setupNuvButtons() {
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "burger") , style: .done, target: self, action: #selector(leftBtnTupped))
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "geo"), style: .plain, target: self, action: #selector(rightBtnTapped))
        
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
}
//MARK: - setup Views
extension CarouselViewController {
    func setupViews() {
        
        carouselCollectionView.register(CarouselEmptyCollectionViewCell.self, forCellWithReuseIdentifier: emptyCellID)
        carouselCollectionView.register(CarouselCityCollectionViewCell.self, forCellWithReuseIdentifier: cityCellId)
        
        view.addSubview(carouselCollectionView)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carouselCollectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
// MARK: - Helpers
private extension CarouselViewController {
    func getCurrentPage(comletition: @escaping (Int) -> Void) -> Int {
        
        let visibleRect = CGRect(origin: carouselCollectionView.contentOffset, size: carouselCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = carouselCollectionView.indexPathForItem(at: visiblePoint) {
            comletition(visibleIndexPath.row)
            return visibleIndexPath.row
        }
        return currentPage
    }
}
//MARK: - UICollectionViewDataSource
extension CarouselViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isStatusOn {
            pageControl.numberOfPages = cityModels.count
            return cityModels.count
        } else {
            pageControl.numberOfPages = 0
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isStatusOn {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityCellId, for: indexPath) as! CarouselCityCollectionViewCell
            cell.model = self.viewModel.forecasts[indexPath.item]
            
            let pageIdx = indexPath.item
            
            cell.goToTFHDetailAction = {
                self.goToTFHDetailPage(pageIdx)
            }
            cell.goToDailyDetailAction = { idx in
                self.goToDailyDetailPage(idx, pageIdx)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellID, for: indexPath) as! CarouselEmptyCollectionViewCell
            cell.addCityAction = {
                self.addCity() {
                    if self.isStatusOn {
                        self.view.reloadInputViews()
                    }
                }
            }
            return cell
        }
    }
}
//MARK: - UICollectionViewDelegate
extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage() { idx in
            self.title = self.pageTitle[idx]
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        currentPage = getCurrentPage() { idx in
            self.title = self.pageTitle[idx]
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = getCurrentPage() { idx in
            if self.isStatusOn && !self.pageTitle.isEmpty {
                self.title = self.pageTitle[idx]
            }
        }
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 29)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
