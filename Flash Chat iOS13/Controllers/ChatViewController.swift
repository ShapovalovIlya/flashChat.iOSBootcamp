//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    //MARK: - Public Properties
    let db = Firestore.firestore()
    var flashChanModel = FlashChatModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        navigationItem.hidesBackButton = true
        title = K.appName
        
        loadMessages()
    }
    
    //MARK: - Methods
    func loadMessages() {
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { quetySnapshot, error in
                
                self.flashChanModel.messages = []
                
                if let error = error {
                    print("Error in retrieving data from Firestore. \(error)")
                } else {
                    guard let snapshotDocuments = quetySnapshot?.documents else { return }
                    for document in snapshotDocuments {
                        let data = document.data()
                        guard let messageSender = data[K.FStore.senderField] as? String else { return }
                        guard let messageBody = data[K.FStore.bodyField] as? String else { return }
                        let newMessage = Message(sender: messageSender, body: messageBody)
                        self.flashChanModel.messages.append(newMessage)
                        
                        DispatchQueue.main.async { [self] in
                            tableView.reloadData()
                            let indexPath = IndexPath(row: flashChanModel.messages.count - 1, section: 0)
                            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                        
                    }
                }
                
            }
        
    }
    
    //MARK: - IBActions
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let error = error {
                    print("There was an issue saving data to firestore, \(error)")
                } else {
                    print("Succesfully saved data!")
                    DispatchQueue.main.async {
                        self.messageTextfield.text?.removeAll()
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            let error = error.localizedDescription
            errorAlert(message: error)
        }
        
    }
    
    //MARK: - errorAlert(_:)
    private func errorAlert(message: String) {
        let alertController = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
}

//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flashChanModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = flashChanModel.messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        // Message from current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.forCurrentUser()
        } else {
            // Message from another sender
            cell.forCompanion()
        }
        
        return cell
    }
    
}


