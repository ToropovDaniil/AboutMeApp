//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Торопов Даниил  on 07.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let profile = LoginData.getLoginData()
    
//MARK: - Override functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewConrtollers = tabBarController.viewControllers else { return }
        
        for viewController in viewConrtollers {
            
            if let welcomeViewController = viewController as? WelcomeViewController
            {
                welcomeViewController.login = profile
            }
            else if let navigationController = viewController as? UINavigationController
            {
            guard let profileViewController = navigationController.topViewController as? ProfileViewController else { return }
                
                profileViewController.user = profile
            }
        }
    }
    
    override func shouldPerformSegue( withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == profile.user,
              passwordTextField.text == profile.password
            else {
                showAlert(
                    title: "Invalid username or password",
                    message: "Please, enter your correct username or password",
                    textField: passwordTextField
                )
                return false
            }
            return true
        }
    
//MARK: - IBAction functions
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops", message: "Your name is \(profile.user) 😉")
        : showAlert(title: "Oops", message: "Your password is \(profile.password) 😉")
    }

    @IBAction func unwindLoginLabels(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
//MARK: - Private Functions
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                textField?.text = ""
            }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
