//
//  MainModels.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright (c) 2020 IDIAZM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Main {
    // MARK: Use cases
    
    enum loadInitialData {
        struct Request {
        }
        struct Response {
            var series: [Serie]?
        }
        struct ViewModel {
            var series: [Serie]?
        }
    }
}
