//
//  HomeViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

import Foundation

private enum HTTPStatusCode: Int {
    case notFound = 404
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private let service = HomeService()
    private let unknownErrorMessage = "Erro desconhecido"
    
    func fetchCEP(_ cep: String) {
        guard let delegate else { return }
        
        service.fetchCEP(cep) { result in
            switch result {
                case .success(let cepModel):
                    delegate.didChangeState(.success(cepModel))
                
                case .failure(let error):
                    if case .statusCode(let code) = error {
                        if code == HTTPStatusCode.notFound.rawValue {
                            delegate.didChangeState(.notFound)
                        }
                    }
                
                    delegate.didChangeState(
                        .failure(message: error.errorDescription ?? self.unknownErrorMessage)
                    )
            }
        }
    }
    
    func setDelegate(_ delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
}
