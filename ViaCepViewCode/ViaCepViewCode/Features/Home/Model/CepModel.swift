//
//  CepModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

struct CepModel: Decodable {
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let estado: String
    let regiao: String
    let ddd: String
}
