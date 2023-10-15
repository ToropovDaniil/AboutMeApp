//
//  BiographyViewController.swift
//  AboutMeApp
//
//  Created by Торопов Даниил  on 11.10.2023.
//

import UIKit

final class BiographyViewController: UIViewController {
    
    @IBOutlet weak var bioLabel: UILabel!
    
    var bio: LoginData!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setGradientColor()
        
        navigationController?.navigationBar.tintColor = UIColor.white
        bioLabel.text = bio.personalData.biography
    }
}
