//
//  APICharacterRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

class APICharacterRepository: APIBaseRepository, CharacterRepositoryProtocol {
    func getCharacters(for serie: Serie, completion: @escaping ([Actor]) -> Void) {
        
        // 1. try to init the URL
        guard let url = APIBaseRepository.createURL(endPoint: .characters(serieID: serie.id ?? -1)) else {
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
                        let decodeActors = try JSONDecoder().decode(DataResponse<Actor>.self, from: data)
                        completion(decodeActors.data?.results ?? [])
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
