//
//  ViewController.swift
//  API_practice
//
//  Created by 伊藤　陽香 on 2020/09/24.
//  Copyright © 2020 伊藤　陽香. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController, UITableViewDataSource {
   
    
    //tableviewを宣言
    @IBOutlet var table: UITableView!
    
    var articles: [Qiita] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        QiitaAPI().fetchArticle { (qiitaResults) in
            print(qiitaResults[0].title)
            
            self.articles = qiitaResults
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
        }
        table.dataSource = self
        

    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        let article = articles[indexPath.row]
        //cell?.textLabel?.text = article.title
        //cell?.detailTextLabel?.text = article.user.name
        tableView.rowHeight = 60
        
        let labelTitle = cell.viewWithTag(1) as! UILabel
        labelTitle.text = article.title

        let labelUser = cell.viewWithTag(2) as! UILabel
        labelUser.text = article.user.name
        return cell
    }
}

