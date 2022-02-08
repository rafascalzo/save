//
//  UIRoundedTableViewCell.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import UIKit

@IBDesignable class UIRoundedTableViewCell: UITableViewCell {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureTableViewCell()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureTableViewCell()
    }
    
    func configureTableViewCell() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
