//
//  SearchHistoryScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

import UIKit

final class SearchHistoryScreen: UIView {
    private var state: SearchHistoryState = .empty {
        didSet {
            renderState(state)
        }
    }
    
    // MARK: - COMPONENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Histórico de pesquisa"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Consulte de forma rápida os CEPs que você pesquisou recentemente"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var textsVerticalStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var emptySearchHistorySubView = DSMessageErrorSubView(
        icon: .emptySearchHistory,
        title: "Seu histórico está vazio",
        message: "Os CEPs pesquisados aparecerão aqui"
    )
    
    private lazy var searchHistoryTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white
        tableView.register(
            SearchHistoryCell.self,
            forCellReuseIdentifier: SearchHistoryCell.identifier
        )
        
        return tableView
    }()
    
    private lazy var button = DSSecondaryButton(
        title: "Limpar histórico",
        action: {}
    )
    
    // MARK: - CONSTRUCTORS
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - AUXILIARY METHODS
    func setTableViewProtocols(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        searchHistoryTableView.delegate = delegate
        searchHistoryTableView.dataSource = datasource
    }
    
    func updateState(_ newState: SearchHistoryState) {
        state = newState
    }
}

// MARK: - CONFIG VIEW
private extension SearchHistoryScreen {
    func configView() {
        backgroundColor = .white
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    func addElements() {
        addSubview(textsVerticalStack)
        addSubview(emptySearchHistorySubView)
        addSubview(searchHistoryTableView)
        addSubview(button)
        
        textsVerticalStack.addArrangedSubview(titleLabel)
        textsVerticalStack.addArrangedSubview(descriptionLabel)
    }
    
    func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            textsVerticalStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            textsVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textsVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            emptySearchHistorySubView.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptySearchHistorySubView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.leadingAnchor.constraint(equalTo: textsVerticalStack.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: textsVerticalStack.trailingAnchor),
            
            searchHistoryTableView.topAnchor.constraint(equalTo: textsVerticalStack.bottomAnchor, constant: 24),
            searchHistoryTableView.leadingAnchor.constraint(equalTo: textsVerticalStack.leadingAnchor),
            searchHistoryTableView.trailingAnchor.constraint(equalTo: textsVerticalStack.trailingAnchor),
            searchHistoryTableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -8)
        ])
    }
}

// MARK: - CONFIG STATES
private extension SearchHistoryScreen {
    func renderState(_ state: SearchHistoryState) {
        switch state {
            case .empty:
                configEmptyState()
            
            case .loaded(let ceps):
                configLoadedState(ceps: ceps)
        }
    }
    
    func configEmptyState() {
        emptySearchHistorySubView.isHidden = false
        button.isHidden = true
        searchHistoryTableView.isHidden = true
    }
    
    func configLoadedState(ceps: CEPs) {
        emptySearchHistorySubView.isHidden = true
        button.isHidden = false
        searchHistoryTableView.isHidden = false
    }
}
