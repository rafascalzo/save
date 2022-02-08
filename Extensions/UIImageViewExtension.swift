//
//  UIImageViewExtension.swift
//  Help
//
//  Created by rvs on 30/01/22.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func loadImageFrom(url : URL) {
        af.setImage(withURL: url)
    }
}
