//
//  SearchHistoryViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

final class SearchHistoryViewModel {
    var delegate: SearchHistoryViewModelDelegate?
    
    func fetchSearchHistory() {
        guard let delegate else { return }
        
        guard let ceps = getHistory() else {
            delegate.changeState(.empty)
            return
        }
        
        delegate.changeState(.loaded(ceps))
    }
    
    func clearSearchHistory() {
        guard let delegate else { return }
        
        UserDefaultsManager.shared.clear(key: .latestCEPs)
        delegate.changeState(.empty)
    }
    
    private func getHistory() -> CEPs? {
        return UserDefaultsManager.shared.getObject(forKey: .latestCEPs)
    }
}
