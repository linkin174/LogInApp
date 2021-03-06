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
    // MARK: Private properties
    private let username = "User"
    private let password = "password"

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackGround(colors: [UIColor.systemMint, UIColor.blue])
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.greetingsLabel.text = username
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutPersonViewController
                
            }
        }
//        guard let greetingVC = segue.destination as? WelcomeViewController else { return }
//        greetingVC.username = username
    }

    // MARK: IBActions
    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Your user name is",
                        message: username,
                        actionTitle: "Understand")
            : showAlert(title: "Your password is",
                        message: password,
                        actionTitle: "Cool")
    }

    @IBAction func logInButtonPressed() {
        if userNameTF.text == username, passwordTF.text == password {
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
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
extension UIView {
    func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors.map { $0.cgColor }
        layer.insertSublayer(gradient, at: 0)
    }
}

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
        if textField == userNameTF { // ???????????????? ?????????? ???????? ??????????????
            passwordTF.becomeFirstResponder() // ?????????? ???????????????????? ????????
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
