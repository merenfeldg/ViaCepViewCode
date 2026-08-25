//
//  SearchHistoryViewModelDelegate.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

protocol SearchHistoryViewModelDelegate: AnyObject {
    func changeState(_ newState: SearchHistoryState)
}
