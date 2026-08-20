//
//  InfoRowComponent.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

final class InfoRowComponent: UIView {
    let key: String
    let value: String
    let isLast: Bool
    
    private lazy var keyLabel: UILabel = {
        let label = UILabel()
        
        label.text = "\(key):"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        
        label.text = value
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var divider = DividerComponent()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    init(
        key: String,
        value: String,
        isLast: Bool = false
    ) {
        self.key = key
        self.value = value
        self.isLast = isLast
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension InfoRowComponent {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
        
        if isLast {
            divider.isHidden = true
        }
    }
    
    private func addElements() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(divider)
        
        horizontalStack.addArrangedSubview(keyLabel)
        horizontalStack.addArrangedSubview(valueLabel)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
