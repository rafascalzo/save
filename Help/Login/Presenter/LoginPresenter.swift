//
//  LoginPresenter.swift
//  Help
//
//  Created by rvs on 12/01/22.
//

import Foundation

class LoginPresenter : LoginPresentation {
    
    weak var view: LoginView?
    var interactor: LoginInteractorInput!
    var router: LoginWireframe!
    
    public init() {}
    
    func login(username: String, password: String) {
        interactor.login(username: username, password: password)
    }
    
    func forgotMyPassword(username: String) {
        //
    }
    
    func registerNewUser() {
        //
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func loginSucceed() {
        router.removeLoginController()
        view?.splashViewDelegate?.userDidLogin()
    }
    
    func onLoginError(message: String) {
        view?.show(error: message)
    }
    
    func registerSucceed() {
        //
    }
    
    func onRegisterError(message: String) {
        view?.show(error: message)
    }
}
