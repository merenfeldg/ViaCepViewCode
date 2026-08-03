//
//  HomeViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

import Foundation

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    private let service = HomeService()
    
    func fetchCEP(_ cep: String) {
        guard let delegate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(900)) { [weak self] in
            guard let self else { return }
            
            service.fetchCEP(cep) { result in
                switch result {
                    case .success(let cepModel):
                        delegate.didFetchCEP(cepModel)
                    
                    case .failure(let error):
                        delegate.didFailWith(error)
                }
            }
        }
    }
    
    func setDelegate(_ delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
}
