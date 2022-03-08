//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: Public Properties
    
    var username: String!
    
    // MARK: Private Properties

    private let gradient = CAGradientLayer()
    
    // MARK: IBOutlets
    
    @IBOutlet var greetingsLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text! += " " + username + "!"
        gradient.frame = view.bounds
        gradient.colors = [UIColor(named: "someColor")?.cgColor ?? UIColor.white.cgColor,
                           UIColor.systemTeal.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
