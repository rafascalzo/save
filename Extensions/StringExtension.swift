//
//  StringExtension.swift
//  Help
//
//  Created by rvs on 27/01/22.
//

import Foundation


extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
    }
}
