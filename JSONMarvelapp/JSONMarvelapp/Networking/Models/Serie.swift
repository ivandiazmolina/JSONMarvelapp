//
//  Serie.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

struct Serie: Codable {
    
    var id: Int?
    var title: String?
    
    init() {
        id = -1
        title = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Serie.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
