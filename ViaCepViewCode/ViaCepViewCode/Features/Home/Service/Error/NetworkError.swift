//
//  NetworkError.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/07/26.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidRequest
    case decodingError(Error)
    case networkFailure(Error)
    case statusCode(code: Int)
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidResponse:
                return "Resposta inválida da API"
            case .invalidRequest:
                return "Erro a montar a request"
            case .decodingError(let error):
                return "Decodificação falhou: \(error.localizedDescription)"
            case .networkFailure(let error):
                return "Falha na conexão: \(error.localizedDescription)"
            case.statusCode(let code):
                return "Status code inesperado: CÓDIGO \(code)"
            case .noData:
                return "Não houve retorno da API"
        }
    }
}
