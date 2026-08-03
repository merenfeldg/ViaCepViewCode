//
//  HomeStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

protocol HomeViewModelDelegate: AnyObject {
    func didFetchCEP(_ cep: CepModel)
    func didFailWith(_ error: NetworkError)
    func didNotFindCEP()
}
