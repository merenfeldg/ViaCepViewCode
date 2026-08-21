//
//  DSFlagMatcher.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 21/08/26.
//

enum FlagMatcher: CaseIterable {
    static func match(_ text: String) -> DSFlag? {
        for flag in DSFlag.allCases {
            if text == flag.name {
                return flag
            }
        }
        return nil
    }
}
