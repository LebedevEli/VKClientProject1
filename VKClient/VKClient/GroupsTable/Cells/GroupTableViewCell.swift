//
//  GroupTableViewCell.swift
//  VKClient
//
//  Created by Илья Лебедев on 28.05.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptiomLabel: UILabel!
    
    var saveGroup: Group?
    
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
        titleLabel.text = nil
        descriptiomLabel.text = nil
        saveGroup = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configureWithGroup(group: Group) {
        descriptiomLabel.text = group.description
        titleLabel.text = group.name
        if let image = group.groupImage {
            myImageView.image = image
        }
        saveGroup = group
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
