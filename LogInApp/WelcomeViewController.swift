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
    private let gradient = CAGradientLayer()
    
    @IBOutlet var greetingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text! += username + "!"
        gradient.frame = view.bounds
        gradient.colors = [(UIColor.init(named: "startColor")?.cgColor ?? UIColor.white.cgColor) as CGColor, UIColor.systemTeal.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
