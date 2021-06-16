//
//  DataStorage.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    private override init() {
        super.init()
    }
    
    var usersArray = [User]()
    var allGroup = [Group]()
    var myFavoriteGroup = [Group]()
    var profile = User()
    var allFeed = [Feed]()
}
