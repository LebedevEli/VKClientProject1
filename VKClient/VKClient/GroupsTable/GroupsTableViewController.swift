//
//  GroupsTableViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 28.05.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let groupTableViewCellReuse = "GroupTableViewCell"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: groupTableViewCellReuse)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.myFavoriteGroup.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: groupTableViewCellReuse, for: indexPath) as? GroupTableViewCell else {return UITableViewCell()}

        cell.configureWithGroup(group: DataStorage.shared.myFavoriteGroup[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        DataStorage.shared.myFavoriteGroup.remove(at: indexPath.row)
        self.tableView.reloadData()
    
    
    }

}
