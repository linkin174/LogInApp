//
//  ViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit
    
class LogInViewController: UIViewController {
    // MARK: IB Outlets

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var reminderButtons: [UIButton]!
    
    // MARK: Private properties

    private let user = User.createUser()
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.main.bounds.maxY <= 568 {
            for button in reminderButtons {
                button.titleLabel?.font = .systemFont(ofSize: 14)
            }
        } else {
            self.stackViewTopConstraint.constant = UIScreen.main.bounds.maxY / 4
            
        }
        userNameTF.delegate = self
        passwordTF.delegate = self
        view.setGradientBackground(UIColor(named: "firstGradientColor")!, UIColor(named: "secondGradientColor")!)
    }

    
    // MARK: Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.destination as? UITabBarController == nil else {
//            let tabBarController = segue.destination as! UITabBarController
//            guard tabBarController.viewControllers == nil else {
//                for viewController in tabBarController.viewControllers! {
//                    if let welcomeVC = viewController as? WelcomeViewController {
//                        welcomeVC.user = user
//                    } else if let navigationVC  = viewController as? UINavigationController {
//                        let aboutVC = navigationVC.topViewController as? AboutPersonViewController
//                        aboutVC?.user = user
//                    }
//                }
//                return
//            }
//            return
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController,
        let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
                tabBarController.tabBar.layer.cornerRadius = 16
            } else if let navigationController = viewController as? UINavigationController {
                let aboutVC = navigationController.topViewController as? AboutPersonViewController
                aboutVC?.user = user
            }
        }
    }



    // MARK: IBActions

    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Your user name is",
                        message: "\(user.login)",
                        actionTitle: "Understand")
            : showAlert(title: "Your password is",
                        message: "\(user.password)",
                        actionTitle: "Cool")
    }

    @IBAction func logInButtonPressed() {
        if userNameTF.text == user.login, passwordTF.text == user.password {
            performSegue(withIdentifier: "toWelcomeScreen", sender: UIButton.self)
        } else {
            showAlert(title: "ERROR",
                      message: "Wrong user name or password",
                      actionTitle: "?????? ??")
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }
}

// MARK: Extensions

extension LogInViewController {
    private func showAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel) { _ in
            self.passwordTF.text?.removeAll()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension UIView {
    func setGradientBackground(_ firstColor: UIColor, _ secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
}
