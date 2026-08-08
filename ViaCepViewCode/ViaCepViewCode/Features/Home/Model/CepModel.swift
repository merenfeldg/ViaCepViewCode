//
//  CepModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

struct CepModel: Decodable {
    let cep: String
    let adress: String
    let complement: String?
    let neighborhood: String?
    let city: String?
    let state: String?
    let region: String?
    let ddd: String?
    
    private enum CodingKeys: String, CodingKey {
        case cep, ddd
        case adress = "logradouro"
        case complement = "complemento"
        case neighborhood = "bairro"
        case city = "localidade"
        case state = "estado"
        case region = "regiao"
    }
}
