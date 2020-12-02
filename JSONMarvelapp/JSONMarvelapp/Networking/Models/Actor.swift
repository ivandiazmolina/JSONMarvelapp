//
//  Actor.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

struct Actor: Codable {
    
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: Thumbail?
    var image: String {
        return "\(thumbnail?.path ?? "").\(thumbnail?.extension ?? "")"
    }
    
    init() {
        id = -1
        name = ""
        description = ""
        thumbnail = Thumbail()
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Actor.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
