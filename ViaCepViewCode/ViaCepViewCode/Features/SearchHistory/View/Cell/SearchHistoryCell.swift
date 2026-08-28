//
//  SearchHistoryCell.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

import UIKit

final class SearchHistoryCell: UITableViewCell {
    static let identifier = String(describing: SearchHistoryCell.self)
    
    private lazy var cepLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray

        return label
    }()
    
    private lazy var searchTimeLabel: UILabel = {
        let label = UILabel()
        
        #warning("TODO: Receber o tempo de pesquisa como parâmetro e pensar em criar um agregate do CpfModel + Tempo que o usuário pesquisou")
        label.text = "Hoje"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var cepAndSearchTimeHorizontalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 0
        
        return stack
    }()
    
    private lazy var streetLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var textsVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var stateAbbreviationView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemGray6.withAlphaComponent(0.7)
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var stateAbbreviationLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var contentHorizontalStack: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.backgroundColor = .yellow
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(all: 16)
        
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 8
        stackView.layer.borderColor = UIColor.gray.cgColor
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(cep: String, street: String, stateAbbreviation: String) {
        cepLabel.text = cep
        streetLabel.text = street
        stateAbbreviationLabel.text = stateAbbreviation
    }
}

//MARK: - CONFIG VIEW
extension SearchHistoryCell {
    private func configView() {
        selectionStyle = .none
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        contentView.addSubview(contentHorizontalStack)
        
        contentHorizontalStack.addArrangedSubview(stateAbbreviationView)
        stateAbbreviationView.addSubview(stateAbbreviationLabel)
        
        contentHorizontalStack.addArrangedSubview(textsVerticalStack)
        textsVerticalStack.addArrangedSubview(cepAndSearchTimeHorizontalStack)
        cepAndSearchTimeHorizontalStack.addArrangedSubview(cepLabel)
        cepAndSearchTimeHorizontalStack.addArrangedSubview(searchTimeLabel)
        textsVerticalStack.addArrangedSubview(streetLabel)
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            contentHorizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            contentHorizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            contentHorizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentHorizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            stateAbbreviationView.widthAnchor.constraint(equalToConstant: 36),
            stateAbbreviationView.heightAnchor.constraint(equalTo: stateAbbreviationView.widthAnchor),
            
            stateAbbreviationLabel.centerXAnchor.constraint(equalTo: stateAbbreviationView.centerXAnchor),
            stateAbbreviationLabel.centerYAnchor.constraint(equalTo: stateAbbreviationView.centerYAnchor),
        ])
    }
}
