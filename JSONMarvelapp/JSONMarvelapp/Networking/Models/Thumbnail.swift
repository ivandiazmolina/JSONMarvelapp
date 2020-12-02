//
//  Thumbnail.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

struct Thumbail: Codable {
    
    var path: String?
    var `extension`: String?
    
    init() {
        path = ""
        `extension` = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Thumbail.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
