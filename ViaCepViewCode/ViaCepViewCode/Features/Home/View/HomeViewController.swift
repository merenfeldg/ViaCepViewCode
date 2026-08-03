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
        viewModel.setStateProtocol(self)
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension HomeViewController: HomeScreenDelegate {
    func searchCEP(_ cep: String) {
        viewModel.fetchCEP(cep)
    }
}

// MARK: - IMPLEMETING STATE PROTOCOL
extension HomeViewController: HomeStateProtocol {
    func cepNotFound() {
        
    }
    
    func cepSearchSuccessed(_ cep: CepModel) {
        
    }
    
    func cepSearchFailed(_ error: Error) {
        showAlertController(
            title: "Atenção!",
            message: error.localizedDescription
        )
    }
}
