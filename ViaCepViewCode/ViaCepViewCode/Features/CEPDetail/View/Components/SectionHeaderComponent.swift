//
//  SectionHeaderComponent.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

// MARK: ENUM
enum TypesSectionHeader {
    case adress
    case location
    
    var name: String {
        switch self {
            case .adress:
                return "Endereço"
            case .location:
                return "Localização"
        }
    }
    
    var icon: String {
        switch self {
            case .adress:
                return "location"
            case .location:
                return "globe.americas.fill"
        }
    }
}

// MARK: - COMPONENT
class SectionHeaderComponent: UIView {
    let type: TypesSectionHeader
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage(systemName: type.icon)
        icon.tintColor = .gray
        
        return icon
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = type.name
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        
        return stack
    }()
    
    init(type: TypesSectionHeader) {
        self.type = type
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension SectionHeaderComponent {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(icon)
        horizontalStack.addArrangedSubview(label)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
        ])
    }
}
