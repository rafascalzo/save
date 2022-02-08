//
//  DonationsTableViewCell.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import UIKit

class DonationsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var donatorImageView: UIRoundedImageView!
    @IBOutlet weak var donatorNameLabel: UILabel!
    
    @IBOutlet weak var donateValueLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func bind() {
        //
    }
    
}


