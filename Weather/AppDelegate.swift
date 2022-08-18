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
        let forecastDM = ForecastDataModel()
        let carouselVM = CarouselViewModel(dataModel: forecastDM)
        
        let onBoardingVC = OnboardingViewController(locationManager: locationManager, viewModel: carouselVM)
        
        let navigationController = UINavigationController(rootViewController: onBoardingVC)
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        // add animation
        UIView.transition(with: window,
                          duration: 0.42,
                          options: .transitionFlipFromLeft,
                          animations: nil,
                          completion: nil)
    }
}

