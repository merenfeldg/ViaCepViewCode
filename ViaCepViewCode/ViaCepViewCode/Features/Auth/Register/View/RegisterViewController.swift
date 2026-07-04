//
//  RegisterViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 03/07/26.
//

import UIKit

final class RegisterViewController: BaseViewController {
    private var screen: RegisterScreen?
    private var viewModel = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setDelegateProtocol(self)
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension RegisterViewController: RegisterScreenDelegate {
    func didTapPrimaryButton() {
        guard let screen else { return }
        viewModel.registerUser(screen.model)
    }
    
    func didTapSecondaryButton() {
        goToLoginScreen()
    }
}

// MARK: - IMPLEMENTING STATE PROTOCOL
extension RegisterViewController: RegisterStateProtocol {
    func registerSuccessed() {
        goToHomeScreen()
    }
    
    func registerFailed(message: String) {
        showAlertController(title: "ATENÇÃO!", message: message)
    }
}

// MARK: - NAVIGATION METHODS
extension RegisterViewController {
    func goToLoginScreen() {
        navigationController?.pushViewController(
            LoginViewController(),
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

