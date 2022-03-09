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
    @IBOutlet weak var topSpacingOutlet: NSLayoutConstraint!
    @IBOutlet weak var loginButtonSpacingOutlet: NSLayoutConstraint!
    

    @IBOutlet weak var reminderStackBottomConstraint: NSLayoutConstraint!
    // MARK: Private properties

    private let username = "User"
    private let password = "password"
    private var screenSizeY: CGFloat = 0
    private var defaultPosition = true
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerKBNotifications()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        screenSizeY = view.bounds.maxY
        setGradientBackGround(colors: [UIColor.systemMint, UIColor.cyan, UIColor.blue])
    }

    deinit {
        removeKNBotifications()
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
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }

    private func setGradientBackGround(colors: [UIColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = colors.map { $0.cgColor }
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func registerKBNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWasShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKNBotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification , object: nil)
    }
    
    @objc private func keyBoardWasShow(notification: NSNotification) {
        
        let info = notification.userInfo!
        let keyboardframe: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        if screenSizeY <= 568  && defaultPosition == true {
            loginButtonSpacingOutlet.constant /= 2
            topSpacingOutlet.constant -= keyboardframe.size.height / 2
        } else if screenSizeY > 568  && defaultPosition == true {
//            loginButtonSpacingOutlet.constant /= 0.5
            topSpacingOutlet.constant -= keyboardframe.size.height / 4
        }
        reminderStackBottomConstraint.constant = keyboardframe.size.height + 20
        defaultPosition = false
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWasHidden(notification: NSNotification) {
        reminderStackBottomConstraint.constant = 54
        topSpacingOutlet.constant = 150
        loginButtonSpacingOutlet.constant = 60
        defaultPosition = true
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
