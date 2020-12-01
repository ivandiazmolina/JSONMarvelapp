//
//  LocalSerieRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

class LocalSerieRepository: SerieRepositoryProtocol {
    
    func getSeries(completion: @escaping ([Serie]) -> Void) {
        completion(SeriesManager.shared.getSeries())
    }
}
