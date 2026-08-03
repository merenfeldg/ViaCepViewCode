//
//  HomeViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

import UIKit

final class HomeViewController: BaseViewController {
    var screen: HomeScreen?
    private let viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    private func configProtocols() {
        screen?.setDelegateProtocol(self)
        viewModel.setDelegate(self)
    }
}

// MARK: - IMPLEMETING SCREEN DELEGATE
extension HomeViewController: HomeScreenDelegate {
    func searchCEP(_ cep: String) {
        viewModel.fetchCEP(cep)
    }
}

// MARK: - IMPLEMETING VIEW MODEL DELEGATE
extension HomeViewController: HomeViewModelDelegate {
    func didFetchCEP(_ cep: CepModel) {
        
    }
    
    func didFailWith(_ error: NetworkError) {
        showAlertController(
            title: "Atenção!",
            message: error.localizedDescription
        )
    }
    
    func didNotFindCEP() {
        
    }
}
