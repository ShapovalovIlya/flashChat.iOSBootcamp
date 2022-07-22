//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

final class WelcomeViewController: UIViewController {
    
    //MARK: - Public properties
    var presenter: WelcomeViewPresenterProtocol!
    
    //MARK: - Private properties
    private let titleLabel: CLTypingLabel = {
        let label = CLTypingLabel()
        label.text = K.appName
        label.font = .systemFont(ofSize: 50)
        label.tintColor = UIColor(named: "BrandBlue")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.tintColor = UIColor(named: "BrandBlue")
        button.backgroundColor = UIColor(named: "BrandLightBlue")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(logInButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Private method
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(registerButton)
        view.addSubview(logInButton)
    }
    
    @objc private func registerButtonTap() {
        presenter.tapOnRegister()
    }
    
    @objc private func logInButtonTap() {
        presenter.tapOnLogIn()
    }
    
}

//MARK: - Set Constraints
extension WelcomeViewController {
    private func setConstraints() {
        // Set titleLabel constraints
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // Set logInButton constraints
        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            logInButton.heightAnchor.constraint(equalToConstant: view.frame.height / 14)
        ])
        // Set RegisterButton constraints
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -5),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            registerButton.heightAnchor.constraint(equalToConstant: view.frame.height / 14)
        ])
    }
}
