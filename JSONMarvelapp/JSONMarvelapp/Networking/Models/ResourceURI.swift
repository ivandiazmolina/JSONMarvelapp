//
//  ResourceURI.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 3/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

struct ResourceURI: Codable {
  
    var resourceURI: String?
    var name: String?
    
    init() {
        resourceURI = ""
        name = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(ResourceURI.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
