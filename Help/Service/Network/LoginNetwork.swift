//
//  LoginNetwork.swift
//  Help
//
//  Created by rvs on 12/01/22.
//

import Alamofire

extension HelpNetwork {
    
    struct Login {
        typealias TokenCompletion = (_ token: TokenData?,_ error: String?) -> Void
        
        static func authenticate(username: String, password: String, completion: @escaping TokenCompletion) {
            let tokenInput = TokenInput(grantType: HelpNetwork.grantType, clientId: HelpNetwork.clientId, clientSecret: HelpNetwork.clientSecret, scope: "", username: username, password: password)
            let url = URLComposer.buildUrl(from: "/oauth/token")
            print(url)
            HelpNetwork.requestObject(url: url, method: .post, parameters: EncodableObject(tokenInput), encoding: URLEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded"], completion: completion)
        }
    }
}

struct TokenInput: Encodable {
    
    let grantType: String
    let clientId: String
    let clientSecret: String
    let scope: String?
    let username: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope = "scope"
        case username = "username"
        case password = "password"
    }
}

struct TokenData: Codable {
    
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
