//
//  ModuleBuilder.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 21.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createWelcomeVC(router: RouterProtocol) -> UIViewController
    func createRegisterVC(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createWelcomeVC(router: RouterProtocol) -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomeViewPresenter(router: router)
        view.presenter = presenter
        return view
    }
    
    func createRegisterVC(router: RouterProtocol) -> UIViewController {
        let view = RegisterViewController()
        let presenter = RegisterViewPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
