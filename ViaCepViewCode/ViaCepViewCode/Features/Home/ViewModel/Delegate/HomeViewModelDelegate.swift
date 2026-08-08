//
//  HomeStateProtocol.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 14/07/26.
//

protocol HomeViewModelDelegate: AnyObject {
    func changeState(_ state: HomeState)
}
