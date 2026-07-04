//
//  DSTextField.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 24/04/26.
//

import UIKit

final class DSTextField: UIView {
    let title: String?
    let placeholder: String
    let leftIcon: DSIconsTextField
    let keyBoardType: UIKeyboardType
    let onChanged: (String) -> Void
    
    lazy var container: UIView = {
        let container = UIView(
            frame: CGRect(x: 0, y: 0, width: 40, height: 40)
        )
        
        return container
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = keyBoardType
        textField.leftView = container
        textField.leftViewMode = .always
        
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.gray.cgColor
        
        return textField
    }()
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView(
            frame: CGRect(x: 10, y: 0, width: 24, height: 20)
        )
        
        icon.image = UIImage(systemName: leftIcon.outlinedIcon)
        icon.tintColor = .gray
        icon.contentMode = .scaleAspectFit
        
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = title
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    init(
        title: String? = nil,
        placeholder: String,
        leftIcon: DSIconsTextField,
        keyBoardType: UIKeyboardType = .default,
        onChanged: @escaping (String) -> Void
    ) {
        self.title = title
        self.placeholder = placeholder
        self.keyBoardType = keyBoardType
        self.leftIcon = leftIcon
        self.onChanged = onChanged
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CONFIG VIEW
extension DSTextField {
    private func configView() {
        addElements()
        setupActions()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        if title != nil {
            addSubview(verticalStackView)
            verticalStackView.addArrangedSubview(titleLabel)
            verticalStackView.addArrangedSubview(textField)
            container.addSubview(iconImage)
        } else {
            addSubview(textField)
            container.addSubview(iconImage)
        }
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        var constraints: [NSLayoutConstraint] = [
            textField.heightAnchor.constraint(equalToConstant: 56),
            
            iconImage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 20),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
        ]
        
        if title != nil {
            constraints += [
                verticalStackView.topAnchor.constraint(equalTo: topAnchor),
                verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        } else {
            constraints += [
                textField.topAnchor.constraint(equalTo: topAnchor),
                textField.bottomAnchor.constraint(equalTo: bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: leadingAnchor),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - ACTIONS
extension DSTextField {
    private func setupActions() {
        textField.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
    
    @objc private func didBeginEditing() {
        textField.layer.borderColor = UIColor.black.cgColor
        iconImage.image = UIImage(systemName: leftIcon.fillIcon)
        iconImage.tintColor = .black
    }
    
    @objc private func didEndEditing() {
        textField.layer.borderColor = UIColor.gray.cgColor
        iconImage.image = UIImage(systemName: leftIcon.outlinedIcon)
        iconImage.tintColor = .gray
    }
}
