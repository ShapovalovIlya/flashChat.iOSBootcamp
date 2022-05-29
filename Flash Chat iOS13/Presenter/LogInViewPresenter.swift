//
//  LogInViewPresenter.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 27.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol LoginViewDelegate {
    func didLogIn()
    func didFailWithError(error: Error)
}

class LoginViewPresenter {
    
    var loginViewDelegate: LoginViewDelegate?
    
    func logIn(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.loginViewDelegate?.didFailWithError(error: error)
            } else {
                self?.loginViewDelegate?.didLogIn()
            }
        }
    }
    
}
