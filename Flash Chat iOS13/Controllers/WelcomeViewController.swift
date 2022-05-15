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

class WelcomeViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
       
    }
    

}
