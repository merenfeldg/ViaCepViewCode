//
//  HomeViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

import Foundation

private enum SearchHistory {
    static let maxItems = 5
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    private let service = HomeService()
    
    func fetchCEP(_ cep: String) {
        guard let delegate else { return }
        
        if case .failure(let failure) = FormValidator.isValidCEP(cep) {
            delegate.changeState(.invalidCEP(message: failure.localizedDescription))
            return
        }
        
        service.fetchCEP(cep) { [weak self] result in
            guard let self else { return }
            
            switch result {
                case .success(let cepModel):
                    saveToHistory(cepModel)
                    delegate.changeState(.success(cepModel))
                
                case .failure:
                    delegate.changeState(.notFound)
            }
        }
    }
    
    func setDelegate(_ delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
}

// MARK: PERSIST IN USER DEFAULTS
private extension HomeViewModel {
    func saveToHistory(_ cep: CepModel) {
        if var cepHistory = fetchCEPHistory() {
            cepHistory.insert(cep, at: 0)
            
            if cepHistory.count > SearchHistory.maxItems {
                cepHistory = Array(cepHistory.prefix(SearchHistory.maxItems))
            }
            
            persistCEPHistory(cepHistory)
        } else {
            persistCEPHistory([cep])
        }
    }
    
    func fetchCEPHistory() -> CEPs? {
        return UserDefaultsManager.shared.getObject(forKey: .latestCEPs)
    }
    
    func persistCEPHistory(_ ceps: CEPs) {
        if let data = try? JSONEncoder().encode(ceps) {
            UserDefaultsManager.shared.save(data, forKey: .latestCEPs)
        }
    }
}
