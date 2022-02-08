//
//  HomeDonationsTableViewCell.swift
//  Help
//
//  Created by rvs on 23/01/22.
//

import UIKit

private let donationsReuseIdentifier = "donationsTableViewCell"

class HomeDonationsTableViewCell: UIRoundedTableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func bind() {
        let nib = UINib(nibName: "DonationsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: donationsReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeDonationsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: donationsReuseIdentifier, for: indexPath) as? DonationsTableViewCell else {
            return UITableViewCell()
        }
        print(indexPath)
        cell.bind()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
