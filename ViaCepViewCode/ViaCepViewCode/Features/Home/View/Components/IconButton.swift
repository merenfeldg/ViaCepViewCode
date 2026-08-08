//
//  SearchButton.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/08/26.
//

import UIKit

enum Icons: String {
    case send = "paperplane.fill"
    case cancel = "xmark"
}

class IconButton: UIButton {
    let icon: Icons
    let didTap: () -> Void
    
    init(
        icon: Icons,
        didTap: @escaping () -> Void
    ) {
        self.icon = icon
        self.didTap = didTap
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension IconButton {
    private func configView() {
        configApperance()
        configAction()
        configConstraints()
    }
    
    private func configApperance() {
        var configuration = UIButton.Configuration.filled()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 14)
        configuration.image = UIImage(
            systemName: icon.rawValue,
            withConfiguration: imageConfiguration
        )
        
        configuration.baseBackgroundColor = .black
        configuration.baseForegroundColor = .white
        self.configuration = configuration
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    private func configConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 56),
            widthAnchor.constraint(equalToConstant: 56)
        ])
    }
}

// MARK: CONFIG ACTION
extension IconButton {
    private func configAction() {
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        didTap()
    }
}
