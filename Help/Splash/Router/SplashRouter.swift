//
//  SplashRouter.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import Foundation
import UIKit

class SplashRouter: SplashWireframe {
    
    weak var viewController: SplashViewController?
    
    init(viewController: SplashViewController) {
        self.viewController = viewController
    }
    
    static func createModule(viewController: SplashViewController) {
        let router = SplashRouter(viewController: viewController)
        let presenter: SplashPresentation = SplashPresenter(router, view: viewController)
        viewController.presenter = presenter
    }
    
    func showLoginView() {
        let loginViewController = LoginViewController()
        loginViewController.splashViewDelegate = viewController
        loginViewController.modalPresentationStyle = .fullScreen
        viewController?.present(loginViewController, animated: true, completion: nil)
    }
    
    func showHomeView() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 0)
        
        let userViewController = UserViewController()
        userViewController.tabBarItem = UITabBarItem(title: "user", image: UIImage(systemName: "person.circle"), tag: 1)
        let viewControllers = [homeViewController, userViewController]
        tabBarController.viewControllers = viewControllers.map({ viewController -> UINavigationController in
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
            navigationController.navigationBar.barTintColor = .yellow
            return navigationController
        })
        tabBarController.modalPresentationStyle = .fullScreen
        viewController?.present(tabBarController, animated: true, completion: nil)
    }
    
}
