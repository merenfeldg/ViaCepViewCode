//
//  CepDetailScreenDelegate.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 21/08/26.
//

protocol CEPDetailScreenDelegate: AnyObject {
    func findStateFlag(from state: String) -> DSFlag
}
