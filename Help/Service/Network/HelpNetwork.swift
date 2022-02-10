//
//  HelpNetwork.swift
//  Help
//
//  Created by rvs on 11/01/22.
//

import Foundation
import Alamofire
import UIKit

class HelpNetwork: Session {
    
    static let shared = HelpNetwork()
    
    static var baseUrl : String {
        return Bundle.main.infoDictionary?["API DEVELOPMENT URL"] as! String
    }
    
    static var clientId: String {
        return Bundle.main.infoDictionary?["CLIENT ID"] as! String
    }
    
    static var clientSecret: String {
        return Bundle.main.infoDictionary?["CLIENT SECRET"] as! String
    }
    
    static var grantType: String {
        return Bundle.main.infoDictionary?["GRANT TYPE"] as! String
    }
    
    static func request(url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest {
        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: nil, requestModifier: nil)
    }
    
    static func requestObject<T: Decodable>(url: URLConvertible, method: HTTPMethod, parameters: EncodableObject? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: [String: String] = [:], completion: @escaping (T?, String?) -> Void) {
        
        guard NetworkUtils.isConnectedToNetwork() else {
            completion(nil, "no_connection")
            return
        }
                      
        var parametersDict: [String: Any]?
        if let parameters = parameters {
            do {
                let data = try JSONEncoder().encode(parameters)
                parametersDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
        request(url: url, method: method, parameters: parametersDict, encoding: encoding, headers: HTTPHeaders(headers)).validate().responseJSON { response in
            // TO DO - validate
            if response.response?.statusCode == HttpStatusCode.unauthorized.rawValue {
                
            }
            
            if response.response?.statusCode == HttpStatusCode.forbidden.rawValue {
                
            }
            
            if response.response?.statusCode == HttpStatusCode.badRequest.rawValue {
                
            }
            
            guard let data = response.data, !data.isEmpty else {
                completion(nil, "empty_body")
                return
            }
            
            switch response.result {
            case .success:
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedObject, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

private enum HttpStatusCode: Int {
    
    case ok = 200
    case created = 201
    case empty = 204
    case badRequest = 400
    case forbidden = 403
    case unauthorized = 401
}

public struct EncodableObject: Encodable {
    private let encode: (Encoder) throws -> Void
    
    init<T: Encodable>(_ encodable: T) {
        encode = encodable.encode
    }
    
    public func encode(to encoder: Encoder) throws {
        try encode(encoder)
    }
}

struct URLComposer {
    
    static func buildUrl(from path: String) -> URLConvertible {
        return HelpNetwork.baseUrl + path
    }
}
