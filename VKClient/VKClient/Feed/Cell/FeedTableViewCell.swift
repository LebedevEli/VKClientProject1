//
//  FeedTableViewCell.swift
//  VKClient
//
//  Created by Илья Лебедев on 02.06.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var bigPostImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: LikeButton!
    @IBOutlet weak var repostButton: LikeButton!
    
    //начальные настройки ячейки
    func setup() {
        postImageView.layer.cornerRadius = 64
        
        
    }
    
    //очистка ячейки
    func clearCell() {
        postImageView.image = nil
        bigPostImageView.image = nil
        authorLabel.text = nil
        timeLabel.text = nil
        postLabel.text = nil
        
        likeButton.isSelected = false
        commentButton.isSelected = false
        repostButton.isSelected = false
    }
    
    //функция вызывается при использовании ячейки
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    func configureFeed(avatar: UIImage?, author: String?, time: String?, post: String?, postPhoto: UIImage?, like: UIImage?, comment: UIImage?, repost: UIImage?) {
        if let avatar = avatar {
            postImageView.image = avatar
        }
        
        if let author = author {
            authorLabel.text = author
        }
        
        if let time = time {
            timeLabel.text = time
        }
        
        if let post = post {
            postLabel.text = post
        }
        
        if let postPhoto = postPhoto {
            bigPostImageView.image = postPhoto
        }
        
        if let comment = comment {
            commentButton.likeImage = comment
        }
        
        if let like = like {
            likeButton.likeImage = like
        }
        
        if let repost = repost {
            repostButton.likeImage = repost
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
