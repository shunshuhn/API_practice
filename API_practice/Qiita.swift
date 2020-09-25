//
//  Qiita.swift
//  API_practice
//
//  Created by 伊藤　陽香 on 2020/09/25.
//  Copyright © 2020 伊藤　陽香. All rights reserved.
//

import Foundation

struct Qiita: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var name: String
    }
}


