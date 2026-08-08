//
//  CEPPreviewCard.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/08/26.
//
import UIKit

final class CEPPreviewCard: UIView {
    private var adress: String
    private var cep: String
    private let didTap: () -> Void
    
    private lazy var cardVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.clipsToBounds = true
        
        stackView.layer.cornerRadius = 8
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(
            top: 56,
            left: 16,
            bottom: 56,
            right: 16
        )
        
        return stackView
    }()
    
    private lazy var cepLabel: UILabel = {
        let label = UILabel()
        
        label.text = cep
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var adressLabel: UILabel = {
        let label = UILabel()
        
        label.text = adress
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(
        adress: String = "",
        cep: String = "",
        didTap: @escaping () -> Void
    ) {
        self.adress = adress
        self.cep = cep
        self.didTap = didTap
        
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cep: String, adress: String) {
        cepLabel.text = cep
        adressLabel.text = adress
    }
}

extension CEPPreviewCard {
    private func configView() {
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
        configTapGesture()
    }
    
    private func addElements() {
        addSubview(cardVerticalStackView)
        cardVerticalStackView.addArrangedSubview(cepLabel)
        cardVerticalStackView.addArrangedSubview(adressLabel)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            cardVerticalStackView.topAnchor.constraint(equalTo: topAnchor),
            cardVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardVerticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    private func configTapGesture() {
        isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapCard)
        )
        
        addGestureRecognizer(tapGesture)
    }
        
    @objc
    private func didTapCard() {
        didTap()
    }
}

