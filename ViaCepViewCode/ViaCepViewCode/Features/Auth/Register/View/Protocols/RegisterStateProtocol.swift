//
//  RegisterStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

protocol RegisterStateProtocol: AnyObject {
    func registerSuccessed()
    func registerFailed(message: String)
}
