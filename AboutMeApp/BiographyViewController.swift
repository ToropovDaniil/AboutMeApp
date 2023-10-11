//
//  BiographyViewController.swift
//  AboutMeApp
//
//  Created by Елена Ажимова  on 11.10.2023.
//

import UIKit

final class BiographyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientColor()
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
