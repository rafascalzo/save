//
//  SplashPresenter.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import Foundation

class SplashPresenter: SplashPresentation {

    weak var view: SplashView?
    var router: SplashWireframe!
     
    public init(_ router: SplashWireframe, view: SplashView) {
        self.router = router
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showLoadingView()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.view?.hideLoadingView()
            if UserDefaultsManager.shared.isUserLoggedIn {
                self?.router.showHomeView()
            } else {
                self?.router.showLoginView()
            }
        }
    }
    
    func showHomeView() {
        router.showHomeView()
    }
}
