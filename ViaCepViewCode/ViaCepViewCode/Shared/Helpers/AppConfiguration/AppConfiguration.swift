//
//  AppConfiguration.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

import Foundation

enum AppConfiguration {
    static var baseURL: String {
        guard let url = Bundle.main.object(
            forInfoDictionaryKey: "BASE_URL"
        ) as? String else {
            fatalError("Não foi possível encontrar a BASE_URL no arquivo info.plist")
        }
        
        return url
    }
}
