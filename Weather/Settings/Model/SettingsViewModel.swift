//
//  SettingsViewModel.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import Foundation
import UIKit

struct Settings {
    let settingsName: String
    let settingsValueOn: String
    let settingsValueOff: String
}

class SettingsViewModel {
    //MARK: - props
    let settings: [Settings] = [
        Settings(settingsName: "Temperature", settingsValueOn: "C", settingsValueOff: "F"),
        Settings(settingsName: "Wind speed", settingsValueOn: "Mi", settingsValueOff: "Km"),
        Settings(settingsName: "Time format", settingsValueOn: "12", settingsValueOff: "24"),
        Settings(settingsName: "Notification", settingsValueOn: "On", settingsValueOff: "Off")
    ]
    
}
