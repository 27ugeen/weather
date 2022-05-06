//
//  SettingsViewModel.swift
//  Weather
//
//  Created by GiN Eugene on 3/5/2022.
//

import Foundation

struct Settings {
    let settingsName: String
    let settingsValueOn: String
    let settingsValueOff: String
}

class SettingsViewModel {
//MARK: - props
    
    let settings: [Settings] = [
    Settings(settingsName: "Температура", settingsValueOn: "C", settingsValueOff: "F"),
    Settings(settingsName: "Скорость ветра", settingsValueOn: "Mi", settingsValueOff: "Km"),
    Settings(settingsName: "Формат времени", settingsValueOn: "12", settingsValueOff: "24"),
    Settings(settingsName: "Уведомления", settingsValueOn: "On", settingsValueOff: "Off")
    ]
}
