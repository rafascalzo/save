//
//  UserDefaultsManager.swift
//  Help
//
//  Created by rvs on 12/01/22.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    
    private let tokenKey = "tokenKey"
    private let tokenTypeKey = "tokenTypeKey"
    private let refreshTokenKey = "refreshTokenKey"
    private let expiresInKey = "expiresInKey"
    private let scopeKey = "scopeKey"
    private let shouldShowAuthenticationViewKey = "shouldShowAuthenticationViewKey"
    
    var isUserLoggedIn: Bool {
        get { return userDefaults.bool(forKey:shouldShowAuthenticationViewKey)}
        set { userDefaults.set(newValue, forKey: shouldShowAuthenticationViewKey) }
    }
    
    func save(token newValue: String) {
        userDefaults.setValue(newValue, forKey: tokenKey)
    }
    
    func getToken() -> String? {
        return userDefaults.string(forKey: tokenKey)
    }
    
    func save(refreshToken newValue: String) {
        userDefaults.set(newValue, forKey: refreshTokenKey)
    }
    
    func getRefreshToken() -> String? {
        userDefaults.string(forKey: refreshTokenKey)
    }
    
    func save(expiresIn newValue: Int) {
        userDefaults.set(newValue, forKey: expiresInKey)
    }
    
    func getExpiresIn() -> Int? {
        return userDefaults.integer(forKey: expiresInKey)
    }
    
    func save(scope newValue: String) {
        userDefaults.set(newValue, forKey: scopeKey)
    }
    
    func getScope() -> String? {
        return userDefaults.string(forKey: scopeKey)
    }
}
