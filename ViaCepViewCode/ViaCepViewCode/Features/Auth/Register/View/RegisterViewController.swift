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
    
    #warning("TODO: IMPLEMENT didTapPrimaryButton METHOD")
    func didTapPrimaryButton() {
    
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
}

