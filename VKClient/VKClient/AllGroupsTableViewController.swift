//
//  AllGroupsTableViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 28.05.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let groupTableViewCellReuse = "GroupTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: groupTableViewCellReuse)
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.allGroup.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: groupTableViewCellReuse, for: indexPath) as? GroupTableViewCell else {return UITableViewCell()}
        
        cell.configureWithGroup(group: DataStorage.shared.allGroup[indexPath.row])


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? GroupTableViewCell,
              let group = cell.saveGroup
        else {return}
        
        
        var isEnableItem = false
        
        for item in DataStorage.shared.myFavoriteGroup {
            if item.name == group.name {
                isEnableItem = true
            }
        }
        
        if !isEnableItem {
            DataStorage.shared.myFavoriteGroup.append(group)
        }
        
    }

}
