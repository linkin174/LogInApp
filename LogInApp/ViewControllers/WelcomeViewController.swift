//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
  
    // MARK: IBOutlets
    
    @IBOutlet var greetingsLabel: UILabel!
    
    // MARK: Public Properties

    var user: User!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text! += " " + user.person.name + " " + user.person.surname + "!"
    }
}

