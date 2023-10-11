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
    
    private let login = LoginData(
        user: "User",
        password: "Password",
        personalData: PersonalData(
            name: "Daniil",
            surname: "Toropov",
            photo: "avatar",
            company: "Pixar",
            department: "Toy Story",
            position: "IOS Developer")
          )

    private let alert = AlertData(
        title: "Invalid username or password",
        message: "Please, enter your correct username or password",
        okTitle: "Ok",
        forgotTitle: "Oops")
    
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
                welcomeViewController.user = login.user
                welcomeViewController.name = login.personalData.name
                welcomeViewController.surname = login.personalData.surname
            }
            else if let navigationController = viewController as? UINavigationController
            {
            guard let profileViewController = navigationController.topViewController as? ProfileViewController else { return }
                
                profileViewController.name = login.personalData.name
                profileViewController.surname = login.personalData.surname
                profileViewController.company = login.personalData.company
                profileViewController.department = login.personalData.department
                profileViewController.position = login.personalData.position
                profileViewController.photo = login.personalData.photo
            }
        }
    }
    
    override func shouldPerformSegue( withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == login.user,
              passwordTextField.text == login.password
            else {
                showAlert(
                    title: alert.title,
                    message: alert.message,
                    textField: passwordTextField
                )
                return false
            }
            return true
        }
    
//MARK: - IBAction functions
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: alert.title, message: "Your name is \(login.user) 😉")
        : showAlert(title: alert.title, message: "Your password is \(login.password) 😉")
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
            title: alert.okTitle,
            style: .default) { _ in
                textField?.text = ""
            }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
