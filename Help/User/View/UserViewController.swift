//
//  UserViewController.swift
//  Help
//
//  Created by rvs on 20/01/22.
//

import UIKit

private let userFeedMenuReuseIdentifier = "UserFeedMenuCollecionViewCell"
private let userFeedReuseIdentifier = "UserFeedCollecionViewCell"

class UserViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIRoundedImageView!
    @IBOutlet weak var storiesLabel: UILabel!
    @IBOutlet weak var storiesLabelInfo: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followersLabelInfo: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followingLabelInfo: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var userFeedMenuCollectionView: UICollectionView!
    @IBOutlet weak var userFeedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserView()
    }
    
    private func setupUserView() {
        // Setup Navigation Bar
        let customView = UsernameProfileView(frame: CGRect(origin: .zero, size: CGSize(width: 414, height: 35)), delegate: self)
        let gest = UITapGestureRecognizer(target: self, action: #selector(haha))
        customView.addGestureRecognizer(gest)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
        
        // Setup View
        let imageUrl = "https://media-exp1.licdn.com/dms/image/C4D03AQFSNdSuRASNhQ/profile-displayphoto-shrink_200_200/0/1582664185469?e=1649289600&v=beta&t=06bLkUeAMJerN_OQwmUBz2VVrb6vcPMIhzIoNxzMXho"
        userImageView.loadImageFrom(url: URL(string: imageUrl) ?? URL(fileURLWithPath: ""))
        profileNameLabel.text = "Rafael"
        aboutLabel.text = """
        🎸 - Music
        💻 - iOS Full Stack Developer
        """
        
        storiesLabel.text = "Stories"
        storiesLabelInfo.text = "\(1323)"
        followersLabel.text = "Followers"
        followersLabelInfo.text = "\(12) \("M")"
        followingLabel.text = "Following"
        followingLabelInfo.text = "\(7) \("k")"
        setupCollectionView()
    }
    @objc func haha(_ sender: Any) {
        print("now")
    }
    
    private func setupCollectionView() {
        let userFeedMenuCell = UINib(nibName: "UserFeedMenuCollectionViewCell", bundle: nil)
        userFeedMenuCollectionView.register(userFeedMenuCell, forCellWithReuseIdentifier: userFeedMenuReuseIdentifier)
        userFeedMenuCollectionView.delegate = self
        userFeedMenuCollectionView.dataSource = self
        
        
        let userFeedCell = UINib(nibName: "UserFeedCollectionViewCell", bundle: nil)
        userFeedCollectionView.register(userFeedCell, forCellWithReuseIdentifier: userFeedReuseIdentifier)
        userFeedCollectionView.delegate = self
        userFeedCollectionView.dataSource = self
    }
}

extension UserViewController : UsernameProfileViewDelegate {
    
    func usernameProfileViewButtonPressed() {
        print("Hey =D")
    }
    
}

extension UserViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == self.userFeedMenuCollectionView ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.userFeedMenuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userFeedMenuReuseIdentifier, for: indexPath) as? UserFeedMenuCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userFeedReuseIdentifier, for: indexPath) as? UserFeedCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.userFeedMenuCollectionView {
            return CGSize(width: view.frame.width / 3, height: 50)
        } else {
            return CGSize(width: view.frame.width / 3, height: view.frame.width / 3)
        }
    }
}
