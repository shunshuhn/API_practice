//
//  QiitaAPI.swift
//  API_practice
//
//  Created by 伊藤　陽香 on 2020/09/25.
//  Copyright © 2020 伊藤　陽香. All rights reserved.
//

import Foundation

class QiitaAPI {
    func fetchArticle(completion: @escaping ([Qiita]) -> Void) {

        let url = "https://qiita.com/api/v2/items"

        guard var urlComponents = URLComponents(string: url) else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in

            guard let jsonData = data else {
                return
            }

            do {
                let articles = try JSONDecoder().decode([Qiita].self, from: jsonData)
                completion(articles)
                
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

