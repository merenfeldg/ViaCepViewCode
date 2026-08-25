//
//  SearchHistoryViewController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 25/08/26.
//

import UIKit

final class SearchHistoryViewController: UIViewController {
    var screen: SearchHistoryScreen?
    
    override func loadView() {
        screen = SearchHistoryScreen()
        view = screen
    }
}
