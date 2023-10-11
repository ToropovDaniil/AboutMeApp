//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Елена Ажимова  on 11.10.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    @IBOutlet weak var personalPhoto: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var name = ""
    var surname = ""
    var company = ""
    var department = ""
    var position = ""
    var photo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        surnameLabel.text = surname
        companyLabel.text = company
        departmentLabel.text = department
        positionLabel.text = position
        
        personalPhoto.image = UIImage(named: photo)
        
        setGradientColor()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        personalPhoto.layer.cornerRadius = personalPhoto.frame.height / 2.5
        personalPhoto.clipsToBounds = true
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
