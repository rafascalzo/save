//
//  LoginContract.swift
//  Help
//
//  Created by rvs on 11/01/22.
//

import Foundation

protocol LoginView: AnyObject {
    
    var presenter: LoginPresentation! { get set }
    var splashViewDelegate: SplashViewDelegate? { get set }
    func show(error message: String)}

protocol LoginPresentation: AnyObject {
    
    var view: LoginView? { get set }
    var interactor: LoginInteractorInput! { get set }
    var router: LoginWireframe! { get set }
    
    func login(username: String, password: String)
    func forgotMyPassword(username: String)
    func registerNewUser()
}

protocol LoginInteractorInput: AnyObject {
    
    var output: LoginInteractorOutput? { get set }
    
    func login(username: String, password: String)
    func retrievePassword(username: String)
    func register()
}

protocol LoginInteractorOutput: AnyObject {
    
    func loginSucceed()
    func onLoginError(message: String)
    func registerSucceed()
    func onRegisterError(message: String)
}

protocol LoginWireframe: AnyObject {
    
    var viewController: LoginViewController? { get set }
    
    static func createModule(viewController: LoginViewController)
    
    func showRegisterView()
    func removeLoginController()
}
