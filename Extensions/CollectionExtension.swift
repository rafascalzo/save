//
//  CollectionExtension.swift
//  Help
//
//  Created by rvs on 27/01/22.
//

import Foundation

extension Collection {
    
    /*
     
     Used to avoid checking if requested index exists on collection
     let array = [1,2,3]
     
     for index in -1...10 {
        if let item = array[safe: index] {
            
        }
     }
     */
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
