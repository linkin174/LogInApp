//
//  ViewController.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 08.03.2022.
//

import UIKit
private let username = "User"
private let password = "password"




class LogInViewController: UIViewController {
    

    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    @IBAction func reminderButtonsPressed(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(title: "Your User Name Is", message: username) :
                showAlert(title: "Your Password Is", message: password)
    }
    

    
    
}

extension LogInViewController {
    private func showAlert(title: String, message: String) {
        let userNameReminderAlert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        userNameReminderAlert.addAction(.init(title: "OK", style: .cancel))
        present(userNameReminderAlert, animated: true)
    }
}

