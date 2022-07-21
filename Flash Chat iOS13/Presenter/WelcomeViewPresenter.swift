//
//  WelcomeViewPresenter.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 21.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

protocol WelcomeViewPresenterProtocol: AnyObject {
    init(router: RouterProtocol)
    func tapOnRegister()
    func tapOnLogIn()
}

class WelcomeViewPresenter: WelcomeViewPresenterProtocol {
    
    var router: RouterProtocol?
    
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    func tapOnRegister() {
        router?.register()
    }
    
    func tapOnLogIn() {
        router?.logIn()
    }
    
    
}
