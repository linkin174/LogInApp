//
//  AboutPersonViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import UIKit

class AboutPersonViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    
    // MARK: Public Properties
    
    var user: User!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(UIColor(named: "firstGradientColor")!, UIColor(named: "secondGradientColor")!)
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = String(user.person.age)
        cityLabel.text = user.person.city
        companyLabel.text = user.person.company
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let moreInfoVC = segue.destination as! MoreInfoViewController
        moreInfoVC.user = user
    }
}
