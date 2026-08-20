//
//  DividerComponent.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 20/08/26.
//

import UIKit

final class DividerComponent: UIView {
    private lazy var dividerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension DividerComponent {
    private func configView() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(dividerView)
    }
        
    private func configConstraints() {
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
