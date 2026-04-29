//
//  LoginScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import UIKit

final class LoginScreen: UIView {
    lazy var emailTextField: DSTextField = {
        return DSTextField(
            title: "Email",
            placeholder: "Digite seu email...",
            leftIcon: .envelope
        )
    }()
    
    lazy var passwordTextField: DSTextField = {
        return DSTextField(
            title: "Password",
            placeholder: "Digite sua senha...",
            leftIcon: .lock
        )
    }()
    
    lazy var primaryButton: DSPrimaryButton = {
        return DSPrimaryButton(
            title: "Login",
            action: {},
        )
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(primaryButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            primaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            primaryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            primaryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ])
    }
}
