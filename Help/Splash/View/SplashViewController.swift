//
//  SplashViewController.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import UIKit

class SplashViewController: UIViewController, SplashView {
    
    var presenter: SplashPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        SplashRouter.createModule(viewController: self)
        presenter.viewDidLoad()
    }
    
}

extension SplashViewController: SplashViewDelegate {
    
    func userDidLogin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.presenter.showHomeView()
        }
    }
    
    func showLoadingView() {
        showActivityViewController(view: self.view)
    }
    
    func hideLoadingView() {
        hideActivityViewController()
    }
}

protocol SplashViewDelegate {
    func userDidLogin()
}
