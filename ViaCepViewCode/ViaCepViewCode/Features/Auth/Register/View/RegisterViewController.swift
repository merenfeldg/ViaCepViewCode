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
