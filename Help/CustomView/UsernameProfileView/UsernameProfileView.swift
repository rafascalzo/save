//
//  UsernameProfileView.swift
//  Help
//
//  Created by rvs on 30/01/22.
//

import UIKit

class UsernameProfileView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    weak var delegate: UsernameProfileViewDelegate?
    
    convenience init(frame: CGRect, delegate: UsernameProfileViewDelegate) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.load()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func load() {
        Bundle.main.loadNibNamed("UsernameProfileView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    @IBAction func usernameProfileViewPressed(_ sender: Any) {
        print("Test =D")
        delegate?.usernameProfileViewButtonPressed()
    }
    
}

protocol UsernameProfileViewDelegate: AnyObject {
    
    func usernameProfileViewButtonPressed()
}
