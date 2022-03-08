//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    var username: String!
    var password: String!

    @IBOutlet var greetingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text! += username + "!"
    }
}
