//
//  APIBaseRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

// Enum to know operation result.
//
// - success: Operation finish without error
// - failure: Operation finish with error
enum APIRequestResult<U> {
    case success(result: U)
    case failure(error: String)
}

// Enum to know operation result.
//
// - success: Operation finish without error
// - failure: Operation finish with error
enum APIEndpoint: String {
    case series = "/series"
}

class APIBaseRepository {
    
    // MARK: Common
    static private let APIKEY = "9935f3cfef0598877a1b4fede8cd1d98"
    static private let HASH = "9a8d5f68b53b2e06080ade63a01aa56b"
    static internal let BASE_URL = "http://gateway.marvel.com/v1/public"
    static internal let FINAL_URL = "?ts=1&apikey=\(APIKEY)&hash=\(HASH)"
    
    
    /// create URL from an enum of APIEndPoint
    /// - Parameter endPoint: endpoint
    /// - Returns: URL object with the Endpoint from API
    static func createURL(endPoint: APIEndpoint) -> URL? {
        return URL(string: BASE_URL + endPoint.rawValue + FINAL_URL)
    }
}
