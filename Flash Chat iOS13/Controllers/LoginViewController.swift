//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK: - IBActions
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let error = error {
                    let localizedError = error.localizedDescription
                    strongSelf.errorAlert(message: localizedError)
                } else {
                    // Navigate to the ChatViewController
                    strongSelf.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
        
    }
    
    //MARK: - errorAlert(_:)
    private func errorAlert(message: String) {
        let alertController = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
}
