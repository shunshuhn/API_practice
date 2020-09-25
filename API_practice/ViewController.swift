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
    
    fileprivate var articles: [Qiita] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        QiitaAPI().fetchArticle { (qiitaResults) in
            print(qiitaResults[0].user)
        }
        
        table.dataSource = self
        

    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
}

