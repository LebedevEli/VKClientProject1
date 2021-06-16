//
//  FriendsTableViewCell.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var saveUser: User?

    
    func setup() {
        myImageView.layer.cornerRadius = 20
        backView.layer.cornerRadius = 20
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowRadius = 5
        backView.layer.shadowOpacity = 0.8
    }
    
    func clearCell() {
        myImageView.image = nil
        nameFriend.text = nil
        saveUser = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configureWithUser(user: User) {
        nameFriend.text = user.name
        if let image = user.avatar {
            myImageView.image = image
        }
        saveUser = user
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }
}
