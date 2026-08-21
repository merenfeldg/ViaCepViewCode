//
//  CEPDetailViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 18/08/26.
//

import UIKit

final class CEPDetailViewController: UIViewController {
    var screen: CEPDetailScreen?
    private let cep: CepModel
    
    init(cep: CepModel) {
        self.cep = cep
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = CEPDetailScreen(cep: cep)
        view = screen
    }
    
    override func viewDidLoad() {
        screen?.setDelegate(self)
    }
}

extension CEPDetailViewController: CEPDetailScreenDelegate {
    func findStateFlag(from state: String) -> DSFlag {
        return FlagMatcher.match(state) ?? .brazil
    }
}
