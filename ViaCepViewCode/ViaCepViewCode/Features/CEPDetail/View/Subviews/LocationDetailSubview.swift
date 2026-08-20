//
//  LocationDetailSubview.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

final class LocationDetailSubview: UIView {
    let state: String
    let region: String
    let ddd: String
    
    private lazy var header = SectionHeaderComponent(type: .location)
    
    private lazy var stateInfo = InfoRowComponent(key: "Estado", value: state)
    private lazy var regionInfo = InfoRowComponent(key: "Região", value: region)
    private lazy var dddInfo = InfoRowComponent(key: "DDD", value: ddd, isLast: true)
    
    private lazy var infosVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    private lazy var contentVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 12
        
        return stack
    }()
    
    init(
        state: String,
        region: String,
        ddd: String
    ) {
        self.state = state
        self.region = region
        self.ddd = ddd
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension LocationDetailSubview {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(contentVerticalStack)
        
        contentVerticalStack.addArrangedSubview(header)
        contentVerticalStack.addArrangedSubview(infosVerticalStack)
        
        infosVerticalStack.addArrangedSubview(stateInfo)
        infosVerticalStack.addArrangedSubview(regionInfo)
        infosVerticalStack.addArrangedSubview(dddInfo)
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
        ])
    }
}
