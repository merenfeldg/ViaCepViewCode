//
//  LoginStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

protocol LoginViewModelDelegate: AnyObject {
    func didLogin()
    func didFailToLogin(message: String)
}
