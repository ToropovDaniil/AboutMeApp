//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Торопов Даниил  on 07.10.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeNameLabel: UILabel!
    
    var user = ""
    var name = ""
    var surname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientColor()
        
        welcomeLabel.textColor = .white
        welcomeNameLabel.textColor = .white
        
        welcomeLabel.text = "Welcome, \(user)!"
        welcomeNameLabel.text = "My name is \(name) \(surname)."
        }
    
//MARK: - Private functions
    private func setGradientColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1.0).cgColor,
            UIColor(red: 0.5, green: 0.5, blue: 0.8, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
