//
//  SearchHistoryViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

import UIKit

final class SearchHistoryViewController: UIViewController {
    var screen: SearchHistoryScreen?
    var viewModel = SearchHistoryViewModel()
    var searchHistory: CEPs?
    
    override func loadView() {
        screen = SearchHistoryScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
        viewModel.fetchSearchHistory()
    }
    
    private func configProtocols() {
        screen?.setTableViewProtocols(delegate: self, datasource: self)
        viewModel.delegate = self
    }
}

extension SearchHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryCell.identifier) as? SearchHistoryCell
        
        let currentCEP = searchHistory?[indexPath.row]
        
        cell?.setupCell(
            cep: currentCEP?.cep ?? "",
            street: currentCEP?.adress ?? "",
            stateAbbreviation: currentCEP?.stateAbbreviation ?? ""
        )
        
        return cell ?? UITableViewCell()
    }
}

extension SearchHistoryViewController: SearchHistoryViewModelDelegate {
    func changeState(_ newState: SearchHistoryState) {
        if case .loaded(let ceps) = newState {
            searchHistory = ceps
        }
        screen?.updateState(newState)
    }
}
