//
//  ProfileTableViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 02.06.2021.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    @IBOutlet var profileTableView: UITableView!
    
    let profileTableViewCellReuse = "ProfileTableViewCell"
    
    var photoArray = [UIImage]()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: profileTableViewCellReuse)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: profileTableViewCellReuse, for: indexPath) as? ProfileTableViewCell else {return UITableViewCell()}
        cell.configure(avatar: #imageLiteral(resourceName: "20"), online: "онлайн", name: """
Лебедев Илья
24 года
""", photo4: #imageLiteral(resourceName: "22"), photo5: #imageLiteral(resourceName: "vkIcon"), photo6: #imageLiteral(resourceName: "20"), myPhoto: "Мои фотографии")

        return cell
    }
    
}

