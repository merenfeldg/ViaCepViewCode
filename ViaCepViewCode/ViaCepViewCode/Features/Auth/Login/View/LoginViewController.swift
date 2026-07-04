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
    }
}

// MARK: - IMPLEMETING DELEGATE PROTOCOL
extension LoginViewController: LoginScreenDelegate {
    
    #warning("TODO: IMPLEMENT didTapPrimaryButton METHOD")
    func didTapPrimaryButton() {
    
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
}
