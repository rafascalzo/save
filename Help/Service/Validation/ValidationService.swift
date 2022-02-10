//
//  ValidationService.swift
//  Help
//
//  Created by rvs on 10/02/22.
//

import Foundation

class ValidationService {
    
    func validate(username string: String?) throws -> String {
        guard let username = string else {
            throw ValidationError.invalidValue(expected: String.self as Any ,received: string as Any)
        }
        return username
    }
}

enum ValidationError: LocalizedError {
    
    case invalidValue(expected: Any, received: Any)
    
    var errorDescription: String? {
        switch (self) {
        case .invalidValue(let expected, let received):  return "Expected \(type(of: expected)) but got \(type(of: received))"
        }
    }
}
