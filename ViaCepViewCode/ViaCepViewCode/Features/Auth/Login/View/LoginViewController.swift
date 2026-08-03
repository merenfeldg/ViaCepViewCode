//
//  ViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import UIKit

final class LoginViewController: BaseViewController {
    var screen: LoginScreen?
    var viewModel = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
    }
    
    private func configProtocols() {
        screen?.setDelegate(self)
        viewModel.setDelegate(self)
    }
}

// MARK: - IMPLEMETING SCREEN DELEGATE
extension LoginViewController: LoginScreenDelegate {
    func didTapPrimaryButton() {
        guard let screen else { return }
        viewModel.login(screen.model)
    }
    
    func didTapSecondaryButton() {
        goToRegisterScreen()
    }
}

// MARK: - IMPLEMENTING VIEW MODEL DELEGATE
extension LoginViewController: LoginViewModelDelegate {
    func didLogin() {
        goToHomeScreen()
    }
    
    func didFailToLogin(message: String) {
        showAlertController(title: "ATENÇÃO!", message: message)
    }
}

// MARK: - NAVIGATION METHODS
extension LoginViewController {
    func goToRegisterScreen() {
        navigationController?.pushViewController(
            RegisterViewController(),
            animated: true
        )
    }
    
    func goToHomeScreen() {
        navigationController?.pushViewController(
            HomeViewController(),
            animated: true
        )
    }
}
