//
//  RegisterStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

protocol RegisterViewModelDelegate: AnyObject {
    func didRegister()
    func didFailToRegister(message: String)
}
