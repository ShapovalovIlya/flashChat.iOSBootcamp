//
//  FlashChatModel.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 18.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

struct FlashChatModel {
    
    var messages: [Message] = []
    let db = Firestore.firestore()
    
    //MARK: - Public methods
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Logout succes")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
