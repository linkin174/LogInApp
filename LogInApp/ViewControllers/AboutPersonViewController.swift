//
//  AboutPersonViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import UIKit

class AboutPersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var name: String!
    var surname: String!
    var age: Int!
    var sex: User.Sex!
    var personImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        surnameLabel.text = surname
        ageLabel.text = String(age)
        sexLabel.text = sex.rawValue
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let moreInfoVC = segue.destination as! MoreInfoViewController
        moreInfoVC.photo = personImage
       }
    }



