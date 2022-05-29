//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Private Properties
    private let presenter = LoginViewPresenter()
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loginViewDelegate = self
    }
    
    //MARK: - IBActions
    @IBAction func loginPressed(_ sender: UIButton) {
        presenter.logIn(email: emailTextfield.text, password: passwordTextfield.text)
        
    }
    
}

//MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func didLogIn() {
        // Navigate to the ChatViewController
        self.performSegue(withIdentifier: K.loginSegue, sender: self)
        
    }
    
    func didFailWithError(error: Error) {
        let alertController = UIAlertController(title: "Warning!", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
}

