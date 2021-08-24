//
//  UserDefaultsHelper.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import Foundation

enum UserDefaultsHelperKey: String {
    case baseSecureUrl = "baseSecureUrl"
}

class UserDefaultsHelper {
    private static let userDefaults = UserDefaults.standard
    
    static func save<T>(value: T, key: UserDefaultsHelperKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    static func get<T>(key: UserDefaultsHelperKey) -> T? {
        guard let object = userDefaults.value(forKey: key.rawValue) as? T else {
            return nil
        }
        return object
    }
}
