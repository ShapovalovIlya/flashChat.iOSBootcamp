//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    //MARK: - Public Properties
    var presenter: RegisterViewPresenterProtocol!
    
    //MARK: - Private properties
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.tintColor = .brandBlue
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
        setConstraints()
    }
    
   //MARK: - Private methods
    private func setupView() {
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        view.addSubview(emailTextField)
        view.addSubview(passwordTextfield)
        view.addSubview(registerButton)
    }
    
    private func setupNavigationBar() {
        
    }
    
    // Register button tapped
    @objc private func registerButtonTap() {
        presenter.registration(email: emailTextField.text, password: passwordTextfield.text)
    }
    
}

//MARK: - Register View Protocol
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

//MARK: - Set Constraints
extension RegisterViewController {
    private func setConstraints() {
        // Set emailTextField constraints
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: view.frame.height / 14),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: emailTextField.frame.height + 5)
        ])
        // Set passwordTextField constraints
        NSLayoutConstraint.activate([
            passwordTextfield.heightAnchor.constraint(equalToConstant: view.frame.height / 14),
            passwordTextfield.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            passwordTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextfield.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -passwordTextfield.frame.height + 10)
        ])
        // Set registerButton constraints
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 10),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            registerButton.heightAnchor.constraint(equalToConstant: view.frame.height / 14)
        ])
    }
}
