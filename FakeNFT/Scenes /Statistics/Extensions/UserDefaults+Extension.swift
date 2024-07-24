//
//  UserDefaults+Extension.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case statisticsSorting
    }

    var statisticsSorting: String {
        get {
            string(forKey: UserDefaultsKeys.statisticsSorting.rawValue) ?? ""
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.statisticsSorting.rawValue)
        }
    }
}
