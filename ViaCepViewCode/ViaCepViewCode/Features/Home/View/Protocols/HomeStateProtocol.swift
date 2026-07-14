//
//  HomeStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

protocol HomeStateProtocol: AnyObject {
    func cepSearchSuccessed(_ cep: CepModel)
    func cepSearchFailed(_ error: Error)
}
