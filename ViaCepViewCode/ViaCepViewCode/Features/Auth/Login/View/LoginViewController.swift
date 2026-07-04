//
//  ViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import UIKit

final class LoginViewController: UIViewController {
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setDelegateProtocol(self)
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension LoginViewController: LoginScreenDelegate {
    func didTapPrimaryButton() {
        goToHomeScreen()
    }
    
    func didTapSecondaryButton() {
        goToRegisterScreen()
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
