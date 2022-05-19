//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Илья Шаповалов on 15.05.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var messageBuble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height / 4
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - Public methods
    func forCurrentUser() {
        leftImageView.isHidden = true
        rightImageView.isHidden = false
        messageBuble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
        messageLabel.textColor = UIColor(named: K.BrandColors.purple)
    }
    
    func forCompanion() {
        leftImageView.isHidden = false
        rightImageView.isHidden = true
        messageBuble.backgroundColor = UIColor(named: K.BrandColors.purple)
        messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
    }
    
}
