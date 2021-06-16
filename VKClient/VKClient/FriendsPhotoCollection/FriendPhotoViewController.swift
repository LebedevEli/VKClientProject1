//
//  FriendPhotoViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 28.05.2021.
//

import UIKit

class FriendPhotoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photos: [UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photos.first
        
    }
    
    
    
}
