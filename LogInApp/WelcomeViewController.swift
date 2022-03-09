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

    var username: String!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackGround(colors: [UIColor.systemMint, UIColor.cyan, UIColor.blue])
        greetingsLabel.text! += " " + username + "!"
    }

    // MARK: Private methods

    private func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colors.map { $0.cgColor }
        view.layer.insertSublayer(gradient, at: 0)
    }
}
