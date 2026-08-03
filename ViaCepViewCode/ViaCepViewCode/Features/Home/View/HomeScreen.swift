//
//  HomeScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

import UIKit

final class HomeScreen: UIView {
    private var cepInputed: String = ""
    private weak var delegate: HomeScreenDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "ViaCEP APP"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Digite um CEP no campo abaixo para encontrar o endereço."
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var searchCEPTextField: DSTextField = {
        return DSTextField(
            placeholder: "Digite o CEP...",
            leftIcon: .search,
            keyBoardType: .numberPad,
            onChanged: setCep
        )
    }()
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCep(_ cep: String) {
        cepInputed = cep
    }
    
    func setDelegate(_ delegate: HomeScreenDelegate) {
        self.delegate = delegate
    }
}

// MARK: - CONFIG VIEW
extension HomeScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        addSubview(searchCEPTextField)
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
            
            searchCEPTextField.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -40),
            searchCEPTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            searchCEPTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
