//
//  LoginViewController.swift
//  Help
//
//  Created by rvs on 11/01/22.
//

import UIKit

class LoginViewController: UIViewController, LoginView {
    
    var presenter: LoginPresentation!
    var splashViewDelegate: SplashViewDelegate?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var userInputStackView: UIStackView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private var usernamePasswordForgotten: String!
    
    @IBAction func forgotMyPasswordTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Enter your username", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "Submit", style: .default) { _ in
            let text = ac.textFields?.first?.text
            guard let username = text, !username.isEmpty else { return }
            print(username)
        }
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlertOk(title: "invalid_username", message: nil)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlertOk(title: "invalid_password", message: nil)
            return
        }
        presenter.login(username: username, password:password)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginRouter.createModule(viewController: self)
    }
}

// MARK: - LoginView
extension LoginViewController {
    
    func show(error message: String) {
        showAlertOk(title: message, message: nil)
    }
}

