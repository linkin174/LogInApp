//
//  MoreInfoViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {
    // MARK: IBOutets

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var personImage: UIImageView!

    
    // MARK: Public Properties

    var user: User!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(UIColor(named: "firstGradientColor")!, UIColor(named: "secondGradientColor")!)
        
        if UIScreen.main.bounds.maxY <= 568 {
            descriptionLabel.font = .systemFont(ofSize: 14)
        }

        personImage?.image = UIImage(named: user.person.photo)
        personImage?.layer.cornerRadius = 20

        descriptionLabel.text = user.person.description
    }
}
