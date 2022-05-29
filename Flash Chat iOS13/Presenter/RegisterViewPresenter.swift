//
//  RegisterViewPresenter.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 29.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol RegisterViewDelegate {
    func didRegister()
    func didFailWithError(error: Error)
}

class RegisterViewPresenter {
    
    var registerViewDelegate: RegisterViewDelegate?
    
    func registration(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.registerViewDelegate?.didFailWithError(error: error)
                } else {
                    self.registerViewDelegate?.didRegister()
                }
            }
        
    }
    
}
