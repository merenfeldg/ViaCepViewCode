//
//  SearchHistoryScreen.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

import UIKit

final class SearchHistoryScreen: UIView {
    
    
    init() {
        super.init(frame: .zero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - CONFIG VIEW
extension SearchHistoryScreen {
    private func configView() {
        addElements()
        disableTranslatesAutoreszingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        //       addSubview()
        //       addSubview()
    }
    
    private func disableTranslatesAutoreszingMaskInAllElements() {
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
