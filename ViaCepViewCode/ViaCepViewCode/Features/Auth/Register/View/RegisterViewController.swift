//
//  RegisterViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 03/07/26.
//

import UIKit

final class RegisterViewController: UIViewController {
    private var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension RegisterViewController: LoginScreenDelegate {
    func didTapPrimaryButton() {
        goToHomeScreen()
    }
    
    func didTapSecondaryButton() {
        goToLoginScreen()
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

