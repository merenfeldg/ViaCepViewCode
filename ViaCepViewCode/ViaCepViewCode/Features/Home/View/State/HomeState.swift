//
//  HomeState.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/08/26.
//

enum HomeState {
    case initial
    case success(CepModel)
    case invalidCEP(message: String)
    case notFound
}
