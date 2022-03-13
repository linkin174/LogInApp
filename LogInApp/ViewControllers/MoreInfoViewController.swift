//
//  MoreInfoViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import UIKit
@IBDesignable
class PaddingLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
}

class MoreInfoViewController: UIViewController {
    // MARK: IBOutets

    @IBOutlet var descriptionLabel: PaddingLabel!
    @IBOutlet var personImage: UIImageView!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    // MARK: Public Properties

    var user: User!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        imageTopConstraint.constant = -40
        descriptionLabel.backgroundColor = .white.withAlphaComponent(0.4)
        descriptionLabel.layer.cornerRadius = 20
        
        view.setGradientBackground(UIColor(named: "firstGradientColor")!, UIColor(named: "secondGradientColor")!)
        let screenSizeY = UIScreen.main.bounds.maxY
        if  screenSizeY <= 568 {
            descriptionLabel.font = .systemFont(ofSize: 14)
        } else if screenSizeY <= 812 {
            descriptionLabel.font = .systemFont(ofSize: 16)
        } else {
            descriptionLabel.font = .systemFont(ofSize: 18)
        }

        personImage?.image = UIImage(named: user.person.photo)
        personImage?.layer.cornerRadius = 20

        descriptionLabel.text = user.person.description
    }
}
