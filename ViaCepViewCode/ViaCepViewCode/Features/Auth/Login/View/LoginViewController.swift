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
    }
    
    private func configProtocols() {
        screen?.setDelegateProtocol(self)
        viewModel.state = self
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension LoginViewController: LoginScreenDelegate {
    func didTapPrimaryButton() {
        guard let screen else { return }
        viewModel.login(screen.model)
    }
    
    func didTapSecondaryButton() {
        goToRegisterScreen()
    }
}

// MARK: - IMPLEMENTING STATE PROTOCOL
extension LoginViewController: LoginStateProtocol {
    func loginSuccessed() {
        goToHomeScreen()
    }
    
    func loginFailed(message: String) {
        showAlertController(
            title: "ATENÇÃO!",
            message: message
        )
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
