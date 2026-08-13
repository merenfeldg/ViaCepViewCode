//
//  UserDefaultsManager.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 13/08/26.
//

import Foundation

enum UserDefaultsKey: String {
    case isUserLoggedIn = "isUserLoggedIn"
    case name = "userName"
}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefauts: UserDefaults
    
    init(userDefauts: UserDefaults = .standard) {
        self.userDefauts = userDefauts
    }
    
    func save<T>(_ value: T, forKey key: UserDefaultsKey) {
        userDefauts.setValue(value, forKey: key.rawValue)
    }
    
    func getString(forKey key: UserDefaultsKey) -> String? {
        return userDefauts.string(forKey: key.rawValue)
    }
    
    func getBool(forKey key: UserDefaultsKey) -> Bool {
        return userDefauts.bool(forKey: key.rawValue)
    }
}
