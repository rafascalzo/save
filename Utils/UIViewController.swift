//
//  UIViewController.swift
//  Help
//
//  Created by rvs on 13/01/22.
//

import Foundation
import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .medium)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UIViewController {
    
    static let activityIndicatorView = SpinnerViewController()
    
    func showAlertOk(title: String?, message: String?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        ac.addAction(ok)
        present(ac, animated: true) {
            print("now")
        }
    }
    
    func showActivityViewController(view: UIView) {
        addChild(UIViewController.activityIndicatorView)
        UIViewController.activityIndicatorView.view.frame = view.frame
        view.addSubview(UIViewController.activityIndicatorView.view)
        UIViewController.activityIndicatorView.didMove(toParent: self)
    }
    
    func hideActivityViewController() {
        UIViewController.activityIndicatorView.willMove(toParent: nil)
        UIViewController.activityIndicatorView.view.removeFromSuperview()
        UIViewController.activityIndicatorView.removeFromParent()
    }
    
}
