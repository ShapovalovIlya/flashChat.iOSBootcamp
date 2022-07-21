//
//  RegisterViewPresenter.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 29.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol RegisterViewProtocol: AnyObject {
    func didRegister()
    func didFailWithError(error: Error)
}

protocol RegisterViewPresenterProtocol: AnyObject {
    init(view: RegisterViewProtocol, router: RouterProtocol)
    func registration(email: String?, password: String?)
    
}

class RegisterViewPresenter: RegisterViewPresenterProtocol {
    
    weak var view: RegisterViewProtocol?
    var router: RouterProtocol?
    
    required init(view: RegisterViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func registration(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                if let error = error {
                    self.view?.didFailWithError(error: error)
                } else {
                    self.view?.didRegister()
                }
            }
        
    }
    
}
