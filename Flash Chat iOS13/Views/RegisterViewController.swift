//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Public Properties
    var presenter: RegisterViewPresenterProtocol!
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBActions
    @IBAction func registerPressed(_ sender: UIButton) {
        presenter.registration(email: emailTextfield.text, password: passwordTextfield.text)
    }
    
}

extension RegisterViewController: RegisterViewProtocol {
    
    func didRegister() {
        // Navigate to the ChatViewController
        self.performSegue(withIdentifier: K.registerSegue, sender: self)
    }
    
    func didFailWithError(error: Error) {
        let alertController = UIAlertController(title: "Warning!", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
}
