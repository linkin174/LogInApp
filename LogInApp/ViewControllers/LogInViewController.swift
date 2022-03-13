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

    private let user = User.createUser()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutPersonViewController
                aboutVC.user = user
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
                      actionTitle: "Что ж")
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
