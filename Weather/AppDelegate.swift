//
//  AppDelegate.swift
//  Weather
//
//  Created by GiN Eugene on 12/4/2022.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let locationManager = CLLocationManager()
        let forecastVM = ForecastViewModel()
        
        let onBoardingVC = OnboardingViewController(locationManager: locationManager, viewModel: forecastVM)
        
        let navigationController = UINavigationController(rootViewController: onBoardingVC)
        
        
//        let navigationController = UINavigationController(rootViewController: CarouselViewController().self)
//        let navigationController = UINavigationController(rootViewController: DetailTFHoursViewController().self)
//        let navigationController = UINavigationController(rootViewController: DetailDailyViewController().self)
//        let navigationController = UINavigationController(rootViewController: SettingsViewController(settingsViewModel: SettingsViewModel().self).self)
//        let navigationController = UINavigationController(rootViewController: MenuViewController().self)
//        navigationController.isNavigationBarHidden = true
//        navigationController.navigationBar.tintColor = .black
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

