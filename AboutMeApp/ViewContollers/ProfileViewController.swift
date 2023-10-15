//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Торопов Даниил  on 11.10.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    @IBOutlet weak var personalPhoto: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var user: LoginData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = user.personalData.name
        surnameLabel.text = user.personalData.surname
        companyLabel.text = user.personalData.company.title
        departmentLabel.text = user.personalData.company.department
        positionLabel.text = user.personalData.company.position
        
        personalPhoto.image = UIImage(named: user.personalData.photo)
        
        setGradientColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        personalPhoto.layer.cornerRadius = personalPhoto.frame.height / 2.5
        personalPhoto.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let biographyController = segue.destination as? BiographyViewController else { return }
        biographyController.bio = user
    }
}
