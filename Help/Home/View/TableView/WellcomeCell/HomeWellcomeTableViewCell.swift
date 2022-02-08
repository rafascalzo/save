//
//  HomeWellcomeTableViewCell.swift
//  Help
//
//  Created by rvs on 20/01/22.
//

import UIKit

class HomeWellcomeTableViewCell: UITableViewCell {

    @IBOutlet weak var welcomeTextField: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        welcomeTextField.text = nil
    }
    
    func bind(title text: String) {
        welcomeTextField.text = text
    }
    
}
