//
//  ViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit

class LogInViewController: UIViewController{
    
    // MARK: IB Outlets

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: Private properties

    private let username = "User"
    private let password = "password"
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        setGradientBackGround(colors: [UIColor.systemMint, UIColor.cyan, UIColor.blue])
    }
    
    // MARK: Override Methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? WelcomeViewController else { return }
        greetingVC.username = userNameTF.text
    }
    
    // MARK: IBActions

    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0 ?
            showAlert(title: "Your user name is", message: username, actionTitle: "Understand") :
            showAlert(title: "Your password is", message: password, actionTitle: "Cool")
    }
    
    @IBAction func logInButtonPressed() {
       if userNameTF.text == username && passwordTF.text == password {
           performSegue(withIdentifier: "", sender: UIButton())
        } else {
            showAlert(title: "ERROR", message: "Wrong user name or password", actionTitle: "Что ж")
            passwordTF.text?.removeAll()
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
        guard let greetingVC = segue.source as? WelcomeViewController else { return }
        greetingVC.dismiss(animated: true) {}
    }
    
    // MARK: Private Methods

    private func showAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: actionTitle, style: .cancel))
        present(alert, animated: true)
    }
}

// MARK: Extensions

extension LogInViewController: UITextFieldDelegate {
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextResponder = textField.superview?.viewWithTag(textField.tag + 1) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            logInButtonPressed()
        }
        return true
    }
    
    private func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colors.map({ $0.cgColor })
        view.layer.insertSublayer(gradient, at: 0)
    }
}

