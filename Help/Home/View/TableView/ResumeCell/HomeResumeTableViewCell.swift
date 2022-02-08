//
//  HomeResumeTableViewCell.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import UIKit

class HomeResumeTableViewCell: UIRoundedTableViewCell {
    
    
    @IBOutlet weak var depositsLabel: UILabel!
    @IBOutlet weak var depositsButton: UIButton!
    @IBOutlet weak var donatedLabel: UILabel!
    @IBOutlet weak var donatedButton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var creditButton: UIButton!
    @IBOutlet weak var donationsLabel: UILabel!
    @IBOutlet weak var donationsButton: UIButton!
    @IBOutlet weak var borrowedLabel: UILabel!
    @IBOutlet weak var borrowedButton: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func bind() {
        
    }
    
    
    @IBAction func depositsButtonTapped(_ sender: Any) {
        print("Deposits button tapped")
    }
    
    @IBAction func donatedButtonTapped(_ sender: Any) {
        print("Donated button tapped")
    }
    
    @IBAction func creditButtonTapped(_ sender: Any) {
        print("Credit button tapped")
    }
    
    @IBAction func donationsButtonTapped(_ sender: Any) {
        print("Donations button tapped")
    }
    
    @IBAction func borrowedButtonTapped(_ sender: Any) {
        print("Borrowed button tapped")
    }
}
