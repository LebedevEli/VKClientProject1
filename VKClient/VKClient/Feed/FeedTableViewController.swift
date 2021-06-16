//
//  FeedTableViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 02.06.2021.
//

import UIKit

class FeedTableViewController: UITableViewController {
    @IBOutlet var feedTableView: UITableView!
    
    let FeedCell = "FeedCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.dataSource = self
        
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: FeedCell)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // нам передается в виде параметра сама tableView, а мы должны вернуть ей количество секций в этой таблице
        
        return 1
    }
    
    // получаем tableView  и номер секции (section), а должны вернуть количество сторок в секции
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 100
    }

    // нам приходит таблица и indexPath (indexPath - это структура где содержится сразу номер секции (section)и номер строки(row)), а вернуть мы должны ячейку TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // объявляем ячейку cell и дальше из таблицы TableView мы берем любую переиспользуемую ячейку при помощи метода dequeueReusableCell (этот метод выдернит ту ячейку которая лежит освобожденная в памяти или если у нее только начало работы то он инициализирует ее) и приводим к типу NewsCustomTableViewCell
        
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell, for: indexPath) as? FeedTableViewCell else {return UITableViewCell()}
        let textAuthor = String("«Биткоин на распутье». Почему цена криптовалюты может упасть до $20 тыс.")
        let postAuthor = String("В пятницу утром цифровая монета вновь не смогла преодолеть уровень в $40 тыс., что вызвало новые опасения по поводу продолжения коррекции курса. Что происходит на рынке и в каком случае снижение усилится?")
        cell.configureFeed(avatar: #imageLiteral(resourceName: "22"), author: textAuthor, time: "04.06.2021, 14:41", post: postAuthor, postPhoto: #imageLiteral(resourceName: "21"), like: #imageLiteral(resourceName: "23"), comment: #imageLiteral(resourceName: "25"), repost: #imageLiteral(resourceName: "24"))
        // Configure the cell...
        
        return cell
    }
}
