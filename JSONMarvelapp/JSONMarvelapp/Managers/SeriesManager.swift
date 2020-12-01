//
//  SeriesManager.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

class SeriesManager {
    
    static let shared = SeriesManager()
    
    private var series: [Serie] = []
    
    func setSeries(_ series: [Serie]) {
        self.series = series
    }
    
    func getSeries() -> [Serie] {
        return series
    }
}
