//
//  MainTabBarController.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 11/08/26.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        createTabBarItem(
            viewController: HomeViewController(),
            title: "Início",
            imageString: "house"
        )
        
        createTabBarItem(
            viewController: SearchHistoryViewController(),
            title: "Histórico",
            imageString: "clock.arrow.circlepath"
        )
        
        customizeApperance()
    }
    
    private func customizeApperance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .separator
    
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .black
    }
    
    private func createTabBarItem(
        viewController: UIViewController,
        title: String,
        imageString: String
    ) {
        let navController = UINavigationController(
            rootViewController: viewController
        )
        
        navController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageString),
            selectedImage: UIImage(systemName: imageString)
        )
        
        addNavControllerInTabBar(navController)
    }
    
    private func addNavControllerInTabBar(_ navController: UINavigationController) {
        if viewControllers == nil {
            viewControllers = [navController]
        } else {
            viewControllers?.append((navController))
        }
    }
}
