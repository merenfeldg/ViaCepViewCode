//
//  FormValidatorError.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 30/04/26.
//

import Foundation

enum FormValidatorError {
    case emptyText
    case passwordShort
    case emailFormatInvalid
    case passwordsNotMatch
    
    case cepMustHasOnlyNumbers
    case cepMustHasEightDigits
}

extension FormValidatorError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .emptyText:
                return "Campo não pode estar vazio"
            case .passwordShort:
                return "A senha não pode ter menos que 6 caracteres"
            case .emailFormatInvalid:
                return "Email inserido está com formato inválido"
            case .passwordsNotMatch:
                return "Digite a mesma senha nos dois campos."
            
            case .cepMustHasOnlyNumbers:
                return "O CEP deve conter apenas números"
            case .cepMustHasEightDigits:
                return "O CEP deve conter 8 dígitos"
        }
    }
}
