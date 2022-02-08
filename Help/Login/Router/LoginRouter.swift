//
//  LoginRouter.swift
//  Help
//
//  Created by rvs on 12/01/22.
//

import Foundation
import UIKit

class LoginRouter: LoginWireframe {
    
    weak var viewController: LoginViewController?
    
    public init(_ viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    static func createModule(viewController: LoginViewController) {
        
        let presenter: LoginPresentation & LoginInteractorOutput = LoginPresenter()
        
        viewController.presenter = presenter
        viewController.presenter.view = viewController
        viewController.presenter.interactor = LoginInteractor()
        viewController.presenter.interactor.output = presenter
        viewController.presenter.router = LoginRouter(viewController)
    }
    
    func showRegisterView() {
        let registerViewController = UIViewController()
        viewController?.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func removeLoginController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
