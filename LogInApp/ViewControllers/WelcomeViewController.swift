//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
  
    // MARK: IBOutlets
    
    @IBOutlet weak var logout: UIButton!
    @IBOutlet var greetingsLabel: UILabel!
    
    // MARK: Public Properties

    var username: String!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackGround(colors: [UIColor.systemMint, UIColor.blue])
        greetingsLabel.text! += " " + username + "!"
    }
    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true)
    }
}

