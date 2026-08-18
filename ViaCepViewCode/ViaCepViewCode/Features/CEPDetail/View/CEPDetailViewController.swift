//
//  CEPDetailViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 18/08/26.
//

import UIKit

final class CEPDetailViewController: UIViewController {
    var screen: CEPDetailScreen?
    
    override func loadView() {
        screen = CEPDetailScreen()
        view = screen
    }
}
