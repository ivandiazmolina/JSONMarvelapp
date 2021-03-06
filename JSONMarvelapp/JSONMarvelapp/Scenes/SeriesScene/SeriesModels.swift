//
//  SeriesModels.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright (c) 2020 IDIAZM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Series {
    
    // MARK: Use cases
    
    enum SetupView {
        struct Response {
            var title: String
        }
        struct ViewModel {
            var title: String?
        }
    }
    
    enum Models {
        struct SerieCellModel {
            var serie: Serie?
        }
    }
}
