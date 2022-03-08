//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: Public Properties
    
    var username: String!
    var password: String!
    
    //MARK: Private Properties
    private let gradient = CAGradientLayer()
    
    //MARK: IBOutlets
    
    @IBOutlet var greetingsLabel: UILabel!
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text! += username + "!"
        gradient.frame = view.bounds
        gradient.colors = [(UIColor.init(named: "someColor")?.cgColor ?? UIColor.white.cgColor) as CGColor, UIColor.systemTeal.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
