//
//  LoginStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

protocol LoginStateProtocol: AnyObject {
    func loginSuccessed()
    func loginFailed(message: String)
}
