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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

