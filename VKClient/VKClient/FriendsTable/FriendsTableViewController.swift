//
//  FriendsTableViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {

//    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var friendsTableView: UITableView!
    let friendsViewControllerIdentifier = "FriendsTableViewCell"
    
    var friend: User!
    let collectionVC = PhotoCollectionViewController()
    
    var names = [
    User(name: "Ilya Ilyin", avatar: #imageLiteral(resourceName: "20"), photoCollection: [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "20")]),
    User(name: "Oleg Olegov", avatar: #imageLiteral(resourceName: "2"), photoCollection: [#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "7")]),
    User(name: "Osel ShrekFriend", avatar: #imageLiteral(resourceName: "16"), photoCollection: [#imageLiteral(resourceName: "19"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "18")]),
    User(name: "Shrek Bolotniy", avatar: #imageLiteral(resourceName: "vkIcon"), photoCollection: [#imageLiteral(resourceName: "11"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "10")]),
    User(name: "Друг Шрека", avatar: #imageLiteral(resourceName: "16"), photoCollection: [#imageLiteral(resourceName: "19"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "18")]),
    User(name: "Илья Алексеев", avatar: #imageLiteral(resourceName: "11"), photoCollection: [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "20")]),
    User(name: "Олег Олегов", avatar: #imageLiteral(resourceName: "19"), photoCollection: [#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "7")]),
    User(name: "Шрек Огр", avatar: #imageLiteral(resourceName: "9"), photoCollection: [#imageLiteral(resourceName: "11"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "10")])
    ]
    
    private var filteredFriends = [User]()
    
    private var searchBarIsEmpty: Bool {
            guard let text = searchController.searchBar.text else {return false}
            return text.isEmpty
        }
    
    private var isFiltering: Bool {
            return searchController.isActive && !searchBarIsEmpty
        }
        
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: friendsViewControllerIdentifier)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func arrayLetter() -> [String] {
            var resultArray = [String]()
            
            for item in names {
                let nameLetter = String(item.name!.prefix(1))
                if !resultArray.contains(nameLetter) {
                    resultArray.append(nameLetter)
                }
            }
           return resultArray
        }
        
        
        func arrayByLetter(letter: String) -> [User] {
            var resultArray = [User]()
            
            for item in names {
                let nameLetter = String(item.name!.prefix(1))
                if nameLetter == letter {
                    resultArray.append(item)
                }
            }
           return resultArray
        }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return arrayLetter()[section].uppercased()
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return 1
        }
        return arrayLetter().count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriends.count
        }
        return arrayByLetter(letter: arrayLetter()[section]).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsViewControllerIdentifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        
        let arrayByLetterItems = arrayByLetter(letter: arrayLetter()[indexPath.section])
        
        if isFiltering {
            friend = filteredFriends[indexPath.row]
        } else {
            friend = arrayByLetterItems[indexPath.row]
        }
            
        friendsTableView.rowHeight = 50
        
        cell.configureWithUser(user: friend)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrayByLetterItems = arrayByLetter(letter: arrayLetter()[indexPath.section])
        if isFiltering {
            friend = filteredFriends[indexPath.row]
        } else {
            friend = arrayByLetterItems[indexPath.row]
        }
        performSegue(withIdentifier: "showPhotos", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            let collectionVC = segue.destination as! PhotoCollectionViewController
            collectionVC.user = friend
        }
    }
    
}

extension FriendsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
            
            filterContentForSearchText(searchController.searchBar.text!)
        }
        
    private func filterContentForSearchText(_ searchText: String) {
            
            filteredFriends = names.filter({ (friend: User) -> Bool in
                return friend.name!.lowercased().contains(searchText.lowercased())
            })
            friendsTableView.reloadData()
        }
}
