//
//  NotFoundCEPView.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 07/08/26.
//


import UIKit

enum MessageErrorIcons: String {
    case notFound = "exclamationmark.triangle.fill"
    case invalidCEP = "exclamationmark.circle.fill"
}

final class MessageErrorCEPView: UIView {
    private let icon: MessageErrorIcons
    private var title: String
    private var message: String
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        let configuration = UIImage.SymbolConfiguration(
            pointSize: 64,
            weight: .bold,
        )
        
        imageView.image = UIImage(
            systemName: icon.rawValue,
            withConfiguration: configuration
        )
        
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = title
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = message
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var textsStackVertical: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
    }()
    
    private lazy var contentStackVertical: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 16
        
        return stack
    }()
    
    init(
        icon: MessageErrorIcons,
        title: String = "",
        message: String = ""
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, message: String) {
        titleLabel.text = title
        descriptionLabel.text = message
    }
}

//MARK: - CONFIG VIEW
extension MessageErrorCEPView {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(contentStackVertical)
        contentStackVertical.addArrangedSubview(iconImageView)
        
        textsStackVertical.addArrangedSubview(titleLabel)
        textsStackVertical.addArrangedSubview(descriptionLabel)
        
        contentStackVertical.addArrangedSubview(textsStackVertical)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            contentStackVertical.topAnchor.constraint(equalTo: topAnchor),
            contentStackVertical.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackVertical.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackVertical.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
