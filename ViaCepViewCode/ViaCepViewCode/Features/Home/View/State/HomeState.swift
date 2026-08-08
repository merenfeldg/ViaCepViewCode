//
//  HomeState.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/08/26.
//

enum HomeState {
    case initial
    case notFound
    case success(CepModel)
    case failure(message: String)
}
