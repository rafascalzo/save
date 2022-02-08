//
//  UIRoundedImageView.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import UIKit

@IBDesignable class UIRoundedImageView: UIImageView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColorFromUIColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
        
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        configureImageView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureImageView()
    }
    
    func configureImageView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColorFromUIColor!.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
