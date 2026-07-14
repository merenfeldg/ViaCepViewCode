//
//  HomeViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

import UIKit

final class HomeViewController: UIViewController {
    var screen: HomeScreen?
    private let viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setDelegateProtocol(self)
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension HomeViewController: HomeScreenDelegate {
    func searchCEP(_ cep: String) {
        viewModel.fetchCEP(cep)
    }
}

