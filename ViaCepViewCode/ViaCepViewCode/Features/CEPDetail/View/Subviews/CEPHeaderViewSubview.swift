//
//  CEPHeaderViewSubview.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

final class CEPHeaderViewSubview: UIView {
    var flag: DSFlag
    let city: String
    let cep: String
    
    private lazy var flags = FlagsComponent(flag: flag)
    
    private lazy var stateLabel: UILabel = {
        let label = UILabel()
        
        label.text = city
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var cepLabel: UILabel = {
        let label = UILabel()
        
        label.text = cep
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        
        return stack
    }()
    
    init(
        flag: DSFlag,
        city: String,
        cep: String
    ) {
        self.flag = flag
        self.city = city
        self.cep = cep
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFlag(_ flag: DSFlag) {
        flags.updateFlag(flag)
    }
}

//MARK: - CONFIG VIEW
extension CEPHeaderViewSubview {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(flags)
        verticalStack.addArrangedSubview(stateLabel)
        verticalStack.addArrangedSubview(cepLabel)
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
