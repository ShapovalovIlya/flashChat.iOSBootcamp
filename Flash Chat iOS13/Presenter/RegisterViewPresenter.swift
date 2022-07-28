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
    func didFailWithError(error: Error)
}

protocol RegisterViewPresenterProtocol: AnyObject {
    init(view: RegisterViewProtocol, router: RouterProtocol)
    /// Set registration with current user email and password
    func registration(email: String?, password: String?)
    /// Pop to WelcomeViewController
    func popToRoot()
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
                    // Call moduleBuilder to create ChatViewController
                }
            }
    }
    
    func popToRoot() {
        router?.initialViewController()
    }
    
}
