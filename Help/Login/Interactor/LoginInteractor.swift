//
//  LoginInteractorInput.swift
//  Help
//
//  Created by rvs on 12/01/22.
//

import Foundation

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput?
    
    func register() {
        
    }
    
    func retrievePassword(username: String) {
        // TO DO
    }
    
    func login(username: String, password: String) {
        HelpNetwork.Login.authenticate(username: username, password: password) { tokenData, error in
            if let tokenData = tokenData {
                UserDefaultsManager.shared.save(token: tokenData.accessToken)
                UserDefaultsManager.shared.save(refreshToken: tokenData.refreshToken)
                UserDefaultsManager.shared.save(expiresIn: tokenData.expiresIn)
                UserDefaultsManager.shared.isUserLoggedIn = true
                self.output?.loginSucceed()
            } else if let error = error {
                self.output?.onLoginError(message: error)
            } else {
                self.output?.onLoginError(message: "error")
            }
        }
    }
}
