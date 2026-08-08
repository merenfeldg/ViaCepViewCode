//
//  HomeScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

import UIKit

final class HomeScreen: UIView {
    private var state: HomeState = .initial {
        didSet {
            renderState(state)
        }
    }
    
    private var cepInputed: String = ""
    private var cepFetched: CepModel?
    private weak var delegate: HomeScreenDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "ViaCEP APP"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Digite um CEP no campo abaixo para encontrar o endereço"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var cepPreviewCard = CEPPreviewCard(didTap: didTapCEPCard)
    
    private lazy var notFoundCEPView = NotFoundCEPView()
    
    private lazy var cancelIconButton = IconButton(
        icon: .cancel,
        didTap: emitInitialState
    )
    
    private lazy var searchCEPTextField: DSTextField = {
        return DSTextField(
            placeholder: "Digite o CEP...",
            leftIcon: .search,
            keyBoardType: .numberPad,
            onChanged: setCep
        )
    }()
    
    private lazy var sendIconButton = IconButton(
        icon: .send,
        didTap: didTapSendIconButton
    )
    
    private lazy var stackHorizontal: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: HomeScreenDelegate) {
        self.delegate = delegate
    }
    
    func updateState(_ newState: HomeState) {
        state = newState
    }
}

// MARK: - ACTIONS
extension HomeScreen {
    func didTapCEPCard() {
        delegate?.didTapCEPCard(cep: cepFetched)
    }
    
    func didTapSendIconButton() {
        delegate?.searchCEP(cepInputed)
    }
    
    private func emitInitialState() {
        renderState(.initial)
    }
    
    private func setCep(_ cep: String) {
        cepInputed = cep
    }
}

// MARK: - CONFIG STATES
extension HomeScreen {
    func renderState(_ state: HomeState) {
        switch state {
            case .initial:
                configInitialState()
            
            case .notFound:
                configNotFoundState()
            
            case .success(let cep):
                configSuccessState(cep: cep)
            
            default:
                break
        }
    }
    
    private func configInitialState() {
        searchCEPTextField.clear()
        cepPreviewCard.isHidden = true
        notFoundCEPView.isHidden = true
    }
    
    private func configSuccessState(cep: CepModel) {
        notFoundCEPView.isHidden = true
        cepPreviewCard.configure(cep: cep.cep, adress: cep.adress)
        cepFetched = cep
        cepPreviewCard.isHidden = false
    }
    
    private func configNotFoundState() {
        cepPreviewCard.isHidden = true
    }
}

// MARK: - CONFIG VIEW
extension HomeScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
        
        cepPreviewCard.isHidden = true
        notFoundCEPView.isHidden = true
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        addSubview(cepPreviewCard)
        addSubview(notFoundCEPView)
        
        addSubview(stackHorizontal)
        stackHorizontal.addArrangedSubview(cancelIconButton)
        stackHorizontal.addArrangedSubview(searchCEPTextField)
        stackHorizontal.addArrangedSubview(sendIconButton)
    }
    
    private func disableTranslatesAutoresizingMaskInAllElements() {
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            cepPreviewCard.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            cepPreviewCard.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            cepPreviewCard.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            notFoundCEPView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            notFoundCEPView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            notFoundCEPView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            stackHorizontal.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -40),
            stackHorizontal.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            stackHorizontal.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}


