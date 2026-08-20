//
//  AdressSectionSubview.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

final class AdressSectionSubview: UIView {
    let street: String
    let neighborhood: String
    let stateAbbreviation: String
    
    private lazy var header = SectionHeaderComponent(type: .adress)
    
    private lazy var streetLabel: UILabel = {
        let label = UILabel()
        
        label.text = street
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var neighborhoodLabel: UILabel = {
        let label = UILabel()
        
        label.text = "\(neighborhood) - \(stateAbbreviation)"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var textsVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var contentVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.backgroundColor = .systemGray6.withAlphaComponent(0.7)
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(all: 24)
        
        return stack
    }()
    
    private lazy var topDivider = DividerComponent()
    private lazy var bottomDivider = DividerComponent()
    
    init(
        street: String,
        neighborhood: String,
        stateAbbreviation: String
    ) {
        self.street = street
        self.neighborhood = neighborhood
        self.stateAbbreviation = stateAbbreviation
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension AdressSectionSubview {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(topDivider)
        addSubview(contentVerticalStack)
        addSubview(bottomDivider)
        
        contentVerticalStack.addArrangedSubview(header)
        contentVerticalStack.addArrangedSubview(textsVerticalStack)
        
        textsVerticalStack.addArrangedSubview(streetLabel)
        textsVerticalStack.addArrangedSubview(neighborhoodLabel)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            contentVerticalStack.topAnchor.constraint(equalTo: topAnchor),
            contentVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topDivider.bottomAnchor.constraint(equalTo: contentVerticalStack.topAnchor),
            topDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            topDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomDivider.topAnchor.constraint(equalTo: contentVerticalStack.bottomAnchor),
            bottomDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomDivider.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
