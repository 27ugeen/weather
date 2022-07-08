//
//  OnboardingViewController.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import UIKit
import CoreLocation
import Alamofire

class OnboardingViewController: UIViewController {
    //MARK: - props
    
    private let locationManager: CLLocationManager
    private let dataModel: ForecastDataModel
    private let viewModel: CarouselViewModel
    
    //MARK: - init
    
    init(locationManager: CLLocationManager, dataModel: ForecastDataModel, viewModel: CarouselViewModel) {
        self.locationManager = locationManager
        self.dataModel = dataModel
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        checkUserLocationPermissions()
        setupViews()
    }
    //MARK: - subviews
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "onboardingImg")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let infoTopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Allow the Weather app to use your device's location data"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xF8F5F5)
        label.font = UIFont.setAppMainFont(16)
        return label
    }()
    
    private let infoMidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To get more accurate weather forecasts while driving or traveling"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.font = UIFont.setAppMainFont(14)
        return label
    }()
    
    private let infoBotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You can change your selection at any time from the application menu"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.font = UIFont.setAppMainFont(14)
        return label
    }()
    
    private lazy var allowLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("USE THE DEVICE LOCATION", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        button.setBackgroundColor(UIColor(rgb: 0xF26E11), forState: .normal)
        button.setBackgroundColor(UIColor(rgb: 0xC65607), forState: .highlighted)
        button.setBackgroundColor(UIColor(rgb: 0xC65607), forState: .selected)
        button.titleLabel?.font = UIFont.setAppMainFont(12)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(allowLocation), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var denieLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NO, I'LL BE ADDING LOCATIONS", for: .normal)
        button.setTitleColor(UIColor(rgb: 0xFDFBF5), for: .normal)
        button.titleLabel?.font = UIFont.setAppMainFont(16)
        
        button.addTarget(self, action: #selector(denieLocation), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - methods
    
    private func fetchForecast(_ coord: CLLocationCoordinate2D) {
        dataModel.currentWeatherURL = dataModel.createURLForCurrentWeather(coord)
    }
    
    @objc private func allowLocation() {
        locationManager.requestAlwaysAuthorization()
        self.checkUserLocationPermissions()
    }
    
    @objc private func denieLocation() {
        UserDefaults.standard.set(false, forKey: "isStatusOn")
        let mainVC = CarouselViewController(dataModel: dataModel, viewModel: viewModel)
        navigationController?.pushViewController(mainVC, animated: true)
        print("Location access denied")
    }
}
//MARK: - setupViews
extension OnboardingViewController {
    private func setupViews() {
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(infoTopLabel)
        contentView.addSubview(infoMidLabel)
        contentView.addSubview(infoBotLabel)
        contentView.addSubview(allowLocationButton)
        contentView.addSubview(denieLocationButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 62),
            imageView.widthAnchor.constraint(equalToConstant: 334),
            imageView.heightAnchor.constraint(equalToConstant: 304),
            
            infoTopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoTopLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            infoTopLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            infoMidLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoMidLabel.topAnchor.constraint(equalTo: infoTopLabel.bottomAnchor, constant: 10),
            infoMidLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            infoBotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            infoBotLabel.topAnchor.constraint(equalTo: infoMidLabel.bottomAnchor, constant: 10),
            infoBotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            allowLocationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            allowLocationButton.topAnchor.constraint(equalTo: infoBotLabel.bottomAnchor, constant: 40),
            allowLocationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            allowLocationButton.heightAnchor.constraint(equalToConstant: 40),
            allowLocationButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -36),
            
            denieLocationButton.topAnchor.constraint(equalTo: allowLocationButton.bottomAnchor, constant: 25),
            denieLocationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            denieLocationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -77)
        ])
    }
}
//MARK: - check UserLocationPermissions
extension OnboardingViewController {
    private func checkUserLocationPermissions() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = 1000
        locationManager.startUpdatingLocation()
        
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("Location access is not determined")
        case .denied, .restricted:
            self.denieLocation()
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            self.fetchForecast(locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
            UserDefaults.standard.set(true, forKey: "isStatusOn")
            
            let mainVC = CarouselViewController(dataModel: dataModel, viewModel: viewModel)
            navigationController?.pushViewController(mainVC, animated: true)
            print("Location access is allowed")
        @unknown default:
            fatalError("Unknown status")
        }
    }
}

//MARK: - CLLocationManagerDelegate
extension OnboardingViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserLocationPermissions()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.fetchForecast(location.coordinate)
    }
}
//MARK: - Alamofire
extension OnboardingViewController {
    func fetchData() {
        // 1
        //MARK: - 8 days, 48 hours
        //    let reqEightdays = AF.request("https://api.openweathermap.org/data/3.0/onecall?units=metric&appid=205e68368240d2136c5ca99aaf88ec20&lat=47.09608&lon=37.54817")
        ////
        //      reqEightdays.responseJSON { (data) in
        //      print("8 days: \(data)")
        //    }
        //MARK: - current weather
        //      let reqCurrent = AF.request("https://api.openweathermap.org/data/2.5/weather?lat=47.09608&lon=37.54817&appid=205e68368240d2136c5ca99aaf88ec20&units=metric")
        //
        //      let reverse = AF.request("http://api.openweathermap.org/geo/1.0/reverse?lat=51.5098&lon=-0.1180&limit=5&appid=205e68368240d2136c5ca99aaf88ec20")
        
        //     let geo = AF.request("http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=205e68368240d2136c5ca99aaf88ec20")
        
        //      geo.responseJSON { (data) in
        //      print("current: \(data)")
        //    }
        
        //      ForecastViewModel().decodeModelFromData()
        
        
    }
}
