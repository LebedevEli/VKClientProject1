//
//  TabBarControllerViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 28.05.2021.
//

import UIKit

class TabBarControllerViewController: UITabBarController {
    
    func fillUsersArray(){

        
//        let friend2 = User(name: "Ilya Ilyin", avatar: #imageLiteral(resourceName: "20"), photoCollection: [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "20")])
//        let friend1 = User(name: "Oleg Olegov", avatar: #imageLiteral(resourceName: "2"), photoCollection: [#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "7")])
//        let friend3 = User(name: "Osel ShrekFriend", avatar: #imageLiteral(resourceName: "16"), photoCollection: [#imageLiteral(resourceName: "19"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "18")])
//        let friend4 = User(name: "Shrek Bolotniy", avatar: #imageLiteral(resourceName: "vkIcon"), photoCollection: [#imageLiteral(resourceName: "11"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "10")])
//        let friend7 = User(name: "Друг Шрека", avatar: #imageLiteral(resourceName: "16"), photoCollection: [#imageLiteral(resourceName: "19"), #imageLiteral(resourceName: "18"), #imageLiteral(resourceName: "18")])
//        let friend6 = User(name: "Илья Алексеев", avatar: #imageLiteral(resourceName: "11"), photoCollection: [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "20")])
//        let friend5 = User(name: "Олег Олегов", avatar: #imageLiteral(resourceName: "19"), photoCollection: [#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "7")])
//        let friend8 = User(name: "Шрек Огр", avatar: #imageLiteral(resourceName: "9"), photoCollection: [#imageLiteral(resourceName: "11"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "10")])
        
//
//        let userArray = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8]
        
        let group1 = Group(name: "Swift", description: "Свифт для начинающих", groupImage: #imageLiteral(resourceName: "13"))
        let group2 = Group(name: "Swift1", description: "Свифт для Junior", groupImage: #imageLiteral(resourceName: "14"))
        let group3 = Group(name: "Swift2", description: "Свифт для Middle", groupImage: #imageLiteral(resourceName: "15"))
        let group4 = Group(name: "Swift3", description: "Свифт для Senior", groupImage: #imageLiteral(resourceName: "13"))
        
        let groupArray = [group1, group2, group3, group4]
        
//        DataStorage.shared.usersArray = userArray
        DataStorage.shared.allGroup = groupArray
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fillUsersArray()
    }

}
