//
//  PhotoCollectionViewCell.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: LikeButton!
    
    
    var savedImage: UIImage?
    
    func clearCell() {
        likeButton = nil
        commentButton = nil
        likeView = nil
        photoImage.image = nil
        savedImage = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(image: UIImage, like: UIImage?, comment: UIImage?) {
        photoImage.image = image
        savedImage = image
        
        if let comment = comment {
            commentButton.likeImage = comment
        }
        
        if let like = like {
            likeButton.likeImage = like
        }
    }

}
