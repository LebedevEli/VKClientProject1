//
//  ProfileTableViewCell.swift
//  VKClient
//
//  Created by Илья Лебедев on 02.06.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myPhotoLabel: UILabel!
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var profileAvatarImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var Photo3: UIImageView!
    
    
    var saveProfile: Profile?
    
    var saveImage: UIImage?
    
    func setup() {
        profileAvatarImage.layer.cornerRadius = 50
        Photo3.layer.cornerRadius = 30
        
    }
    
    func clearCell() {
        myPhotoLabel.text = nil
        profileAvatarImage.image = nil
        profileName.text = nil
        photo1.image = nil
        photo2.image = nil
        Photo3.image = nil
        saveProfile = nil
    }
    
    func configure(avatar: UIImage?, online: String?, name: String?, photo4: UIImage?, photo5: UIImage?, photo6: UIImage?, myPhoto: String?) {
        profileAvatarImage.image = avatar
        saveImage = avatar
        
        if let myPhoto = myPhoto {
            myPhotoLabel.text = myPhoto
        }
        
        if let name = name {
            profileName.text = name
        }
        
        if let online = online {
            onlineLabel.text = online
        }
        
        if let photo4 = photo4 {
            photo1.image = photo4
        }
        
        if let photo5 = photo5 {
            photo2.image = photo5
        }

        if let photo6 = photo6 {
            Photo3.image = photo6
        }

     
        
        
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
