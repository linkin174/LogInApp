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
    
    //Constraints
    @IBOutlet var topSpacingConstraint: NSLayoutConstraint!
    @IBOutlet var loginButtonSpacingConstraint: NSLayoutConstraint!

    // MARK: Private properties
    private let username = "User"
    private let password = "password"

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerKBNotifications()
        setGradientBackGround(colors: [UIColor.systemMint, UIColor.cyan, UIColor.blue])
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: Initialization
    deinit {
        removeKBNotifications()
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? WelcomeViewController else { return }
        greetingVC.username = username
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
                      actionTitle: "Что ж")
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }

    // MARK: Private Methods
    private func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colors.map { $0.cgColor }
        view.layer.insertSublayer(gradient, at: 0)
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

    private func registerKBNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func removeKBNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyBoardWasShown(notification: NSNotification) {
        
        let info = notification.userInfo!
        let offset = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size.height
        
        if UIScreen.main.bounds.maxY <= 568 {
            loginButtonSpacingConstraint.constant = UIScreen.main.bounds.maxY / 15
            topSpacingConstraint.constant = offset + 40
            view.frame.origin = CGPoint(x: 0, y: -offset)
        } else {
            topSpacingConstraint.constant = offset * 1.6
            loginButtonSpacingConstraint.constant = UIScreen.main.bounds.maxY / 18
            view.frame.origin = CGPoint(x: 0, y: -offset)
        }
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWasHidden(notification: NSNotification) {
        topSpacingConstraint.constant = 150
        loginButtonSpacingConstraint.constant = 60
        view.frame.origin = CGPoint(x: 0, y: 0)
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF { // Проверка какое поле выбрано
            passwordTF.becomeFirstResponder() // Выбор следующего поля
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
