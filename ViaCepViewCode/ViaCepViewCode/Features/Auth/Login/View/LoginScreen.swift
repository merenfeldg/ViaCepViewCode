//
//  LoginScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import UIKit

final class LoginScreen: UIView {
    var model = LoginModel()
    var delegate: LoginScreenDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Bem-vindo de volta!"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Digite suas informações para continuar."
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var emailTextField: DSTextField = {
        return DSTextField(
            title: "Email",
            placeholder: "Digite seu email...",
            leftIcon: .envelope,
            onChanged: setEmail
        )
    }()
    
    private lazy var passwordTextField: DSTextField = {
        return DSTextField(
            title: "Senha",
            placeholder: "Digite sua senha...",
            leftIcon: .lock,
            onChanged: setPassword
        )
    }()
    
    private lazy var primaryButton: DSPrimaryButton = {
        return DSPrimaryButton(
            title: "Login",
            action: didTapPrimaryButton,
        )
    }()
    
    private lazy var secondaryButton: DSSecondaryButton = {
        return DSSecondaryButton(
            title: "Se registrar",
            action: didTapSecondaryButton,
        )
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegateProtocol(_ delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
}

//MARK: - MODEL's SET METHODS
extension LoginScreen {
    private func setEmail(_ email: String) {
        model.email = email
    }
    
    private func setPassword(_ password: String) {
        model.password = password
    }
}

// MARK: - ACTIONS
extension LoginScreen {
    private func didTapPrimaryButton() {
        delegate?.didTapPrimaryButton()
    }
    
    private func didTapSecondaryButton() {
        delegate?.didTapSecondaryButton()
    }
}

// MARK: - CONFIG VIEW
extension LoginScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        
        addSubview(primaryButton)
        addSubview(secondaryButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 36),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            primaryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 36),
            primaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            primaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            secondaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secondaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
