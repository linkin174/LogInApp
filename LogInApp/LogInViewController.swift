//
//  ViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit



class LogInViewController: UIViewController {
    
    private let gradient = CAGradientLayer()
    private let username = "User"
    private let password = "password"

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient.frame = view.bounds
        gradient.colors = [(UIColor.init(named: "startColor")?.cgColor ?? UIColor.white.cgColor) as CGColor, UIColor.systemTeal.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        passwordTF.text?.removeAll()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? WelcomeViewController else { return }
        greetingVC.modalPresentationStyle = .fullScreen
        greetingVC.username = userNameTF.text
        greetingVC.password = userNameTF.text
    }
    
    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(title: "Your User Name Is", message: username) :
            showAlert(title: "Your Password Is", message: password)
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text?.isEmpty == true {
            showAlert(title: "Name Error", message: "Enter User Name")
        } else if passwordTF.text?.isEmpty == true {
            showAlert(title: "Password Error", message: "Enter password")
        } else if userNameTF.text == username,
                  passwordTF.text == password
        {
            performSegue(withIdentifier: "", sender: UIButton())
        } else {
            showAlert(title: "LogIn Error", message: "Wrong User Name or Password")
            passwordTF.text?.removeAll()
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        self.userNameTF.text?.removeAll()
        self.passwordTF.text?.removeAll()
        guard let greetingVC = segue.source as? WelcomeViewController else { return }
        greetingVC.dismiss(animated: true) {
            
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            logInButtonPressed()
        }
        return true
    }
    
    private func showAlert(title: String, message: String) {
        let userNameReminderAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        userNameReminderAlert.addAction(.init(title: "OK", style: .cancel))
        present(userNameReminderAlert, animated: true)
    }
}
 
