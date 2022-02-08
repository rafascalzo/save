//
//  SplashContract.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import Foundation

protocol SplashView: AnyObject {
    
    var presenter: SplashPresentation! { get set }
    
    func showLoadingView()
    func hideLoadingView()
}

protocol SplashPresentation: AnyObject {
    
    var view: SplashView? { get set }
    var router: SplashWireframe! { get set }
    
    func viewDidLoad()
    func showHomeView()
}

protocol SplashWireframe: AnyObject {
    
    var viewController: SplashViewController? { get set }
    
    static func createModule(viewController: SplashViewController)
    func showLoginView()
    func showHomeView()
}
