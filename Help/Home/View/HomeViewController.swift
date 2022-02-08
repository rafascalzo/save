//
//  HomeViewController.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import UIKit

private let homeWellcomeReuseIdentifier = "homeWellcomeTableViewCell"
private let homeResumeReuseIdentifier = "homeResumeTableViewCell"
private let homeDonationsReuseIdentifier = "homeDonationsTableViewCell"

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let wellcomeCell = UINib(nibName: "HomeWellcomeTableViewCell", bundle: nil)
        homeTableView.register(wellcomeCell, forCellReuseIdentifier: homeWellcomeReuseIdentifier)
        let resumeCell = UINib(nibName: "HomeResumeTableViewCell", bundle: nil)
        homeTableView.register(resumeCell, forCellReuseIdentifier: homeResumeReuseIdentifier)
        let donationsCell = UINib(nibName: "HomeDonationsTableViewCell", bundle: nil)
        homeTableView.register(donationsCell, forCellReuseIdentifier: homeDonationsReuseIdentifier)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: homeWellcomeReuseIdentifier, for: indexPath) as? HomeWellcomeTableViewCell else {
                return UITableViewCell()
            }
            cell.bind(title: "Olá, Rafa")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: homeResumeReuseIdentifier, for: indexPath) as? HomeResumeTableViewCell else {
                return UITableViewCell()
            }
            cell.bind()
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: homeDonationsReuseIdentifier, for: indexPath) as? HomeDonationsTableViewCell else {
                return UITableViewCell()
            }
            cell.bind()
            return cell
        default: return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1: return 450
        case 2: return 400
        default: return 150
        }
    }
    
}
