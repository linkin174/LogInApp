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

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var reminderStackBottomConstraint: NSLayoutConstraint!
    // MARK: Private properties

    private let username = "User"
    private let password = "password"
    private var reminderStackViewConstraints =  [NSLayoutConstraint]()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWasShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        let greetingVC = segue.destination as! WelcomeViewController
        greetingVC.username = userNameTF.text
        greetingVC.modalPresentationStyle = .fullScreen
        greetingVC.modalTransitionStyle = .flipHorizontal
    }

    // MARK: IBActions

    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0 ?
            showAlert(title: "Your user name is", message: username, actionTitle: "Understand") :
            showAlert(title: "Your password is", message: password, actionTitle: "Cool")
    }

    @IBAction func logInButtonPressed() {
        if userNameTF.text == username, passwordTF.text == password {
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
        } else {
            showAlert(title: "ERROR", message: "Wrong user name or password", actionTitle: "Что ж")
            passwordTF.text?.removeAll()
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTF.text?.removeAll()
        passwordTF.text?.removeAll()
    }

    // MARK: Private Methods

    private func showAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: actionTitle, style: .cancel))
        present(alert, animated: true)
    }

    private func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colors.map { $0.cgColor }
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    @objc private func keyBoardWasShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardframe: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        reminderStackBottomConstraint.constant = keyboardframe.size.height + 20
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWasHidden(notification: NSNotification) {
        reminderStackBottomConstraint.constant = 54
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: Extensions

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {                                        //Проверка какое поле выбрано
           passwordTF.becomeFirstResponder()                               //Выбор следующего поля
        } else {
            logInButtonPressed()
        }
        return true
    }
    
}
