//
//  CEPDetailScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 18/08/26.
//

import UIKit

class CEPDetailScreen: UIView {
    private let cep: CepModel
    private weak var delegate: CEPDetailScreenDelegate?
    private let defaultMessage = "Não informado"
    
    private lazy var header = CEPHeaderViewSubview(
        flag: .brazil,
        city: cep.city ?? defaultMessage,
        cep: cep.cep
    )
    
    private lazy var adressSection = AdressSectionSubview(
        street: cep.adress,
        neighborhood: cep.neighborhood ?? defaultMessage,
        stateAbbreviation: cep.stateAbbreviation ?? defaultMessage
    )
    
    private lazy var locationSection = LocationDetailSubview(
        state: cep.state ?? defaultMessage,
        region: cep.region ?? defaultMessage,
        ddd: cep.ddd ?? defaultMessage
    )
    
    init(cep: CepModel) {
        self.cep = cep
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: CEPDetailScreenDelegate) {
        self.delegate = delegate
        
        let flag = delegate.findStateFlag(from: cep.state ?? "")
        header.updateFlag(flag)
    }
}

//MARK: - CONFIG VIEW
extension CEPDetailScreen {
    private func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(header)
        addSubview(adressSection)
        addSubview(locationSection)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            header.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            adressSection.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 24),
            adressSection.leadingAnchor.constraint(equalTo: leadingAnchor),
            adressSection.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationSection.topAnchor.constraint(equalTo: adressSection.bottomAnchor, constant: 24),
            locationSection.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            locationSection.trailingAnchor.constraint(equalTo: header.trailingAnchor),
        ])
    }
}
