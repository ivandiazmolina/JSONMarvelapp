//
//  SeriesRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

protocol SerieRepositoryProtocol {
    func getSeries(completion: @escaping([Serie]) -> Void)
}

class SerieRepository {
  
    private var apiRepository: SerieRepositoryProtocol = APISerieRepository()
    private var localRepository: SerieRepositoryProtocol = LocalSerieRepository()
    
    /// Method that requests the series
    /// - Parameter completion: completion
    func getSeries(completion: @escaping ([Serie]) -> Void) {
        
        // 1. try to get the local series
        localRepository.getSeries { [weak self] (series) in
            
            // 2. return the local series if it is not empty
            if !series.isEmpty {
                completion(series)
            }
            
            // 3. try to get the remote series
            self?.apiRepository.getSeries { (series) in
                
                // 4. if it is not empty, save it in local
                if !series.isEmpty {
                    SeriesManager.shared.setSeries(series)
                }
                
                // 5. return the series
                completion(series)
            }
        }
    }
}
