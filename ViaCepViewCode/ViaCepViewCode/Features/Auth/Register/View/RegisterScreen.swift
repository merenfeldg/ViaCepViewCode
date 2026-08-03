//
//  RegisterScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 03/07/26.
//

import UIKit

final class RegisterScreen: UIView {
    var model = RegisterModel()
    weak var delegate: RegisterScreenDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Bem-vindo ao ViaCep APP!"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Digite suas informações para começar."
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameTextField: DSTextField = {
        return DSTextField(
            title: "Nome",
            placeholder: "Digite seu nome...",
            leftIcon: .envelope,
            onChanged: setName
        )
    }()
    
    private lazy var emailTextField: DSTextField = {
        return DSTextField(
            title: "Email",
            placeholder: "Digite seu email...",
            leftIcon: .lock,
            onChanged: setEmail
        )
    }()
    
    private lazy var passwordTextField: DSTextField = {
        return DSTextField(
            title: "Senha",
            placeholder: "Digite sua senha...",
            leftIcon: .envelope,
            onChanged: setPassword
        )
    }()
    
    private lazy var confirmPasswordTextField: DSTextField = {
        return DSTextField(
            title: "Confirma senha",
            placeholder: "Digite a senha novamente...",
            leftIcon: .lock,
            onChanged: setConfirmPassword
        )
    }()
    
    private lazy var primaryButton: DSPrimaryButton = {
        return DSPrimaryButton(
            title: "Cadastrar",
            action: didTapPrimaryButton,
        )
    }()
    
    private lazy var secondaryButton: DSSecondaryButton = {
        return DSSecondaryButton(
            title: "Se registrar",
            action: didTapSecondaryButton,
        )
    }()
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: RegisterScreenDelegate) {
        self.delegate = delegate
    }
}

//MARK: - MODEL's SET METHODS
extension RegisterScreen {
    private func setName(_ name: String) {
        model.email = name
    }
    
    private func setEmail(_ email: String) {
        model.email = email
    }
    
    private func setPassword(_ password: String) {
        model.password = password
    }
    
    private func setConfirmPassword(_ confirmPassword: String) {
        model.password = confirmPassword
    }
}

// MARK: - ACTIONS
extension RegisterScreen {
    private func didTapPrimaryButton() {
        delegate?.didTapPrimaryButton()
    }
    
    private func didTapSecondaryButton() {
        delegate?.didTapSecondaryButton()
    }
}

// MARK: - CONFIG VIEW
extension RegisterScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        
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
            
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            primaryButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 36),
            primaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            primaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            secondaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secondaryButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondaryButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
