//
//  AppConfiguration.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

import Foundation

enum KeyInfo: String {
    case baseURL = "baseURL"
}

enum GetInfo {
    static func fetch(key: KeyInfo) -> Any {
        guard let value = Bundle.main.infoDictionary?[key.rawValue] else {
            fatalError("A chave: \(key) não foi encontrada no arquivo Info.plist")
        }
        return value
    }
}
