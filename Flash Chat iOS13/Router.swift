//
//  Router.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 21.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilder? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func register()
    func logIn()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilder?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilder) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    /// Routing to welcomeViewController
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let welcomeViewController = moduleBuilder?.createWelcomeVC(router: self) else { return }
        navigationController.viewControllers = [welcomeViewController]
    }
    /// Routing to register view
    func register() {
        guard let navigationController = navigationController else { return }
        guard let registerViewController = moduleBuilder?.createRegisterVC(router: self) else { return }
        navigationController.viewControllers = [registerViewController]
    }
    /// Routing to log in view
    func logIn() {
        guard let navigationController = navigationController else { return }

    }
}
