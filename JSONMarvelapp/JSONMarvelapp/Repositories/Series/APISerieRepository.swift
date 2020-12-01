//
//  APISerieRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

class APISerieRepository: APIBaseRepository, SerieRepositoryProtocol {
    
    func getSeries(completion: @escaping ([Serie]) -> Void) {
        
        // 1. try to init the URL
        guard let url = APIBaseRepository.createURL(endPoint: .series) else {
            completion([])
            return
        }
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let decodeSeries = try JSONDecoder().decode(DataResponse<Serie>.self, from: data)
                        completion(decodeSeries.data?.results ?? [])
                        return
                    } catch {
                        completion([])
                        return
                    }
                }
            }.resume()
        }
    }
}
