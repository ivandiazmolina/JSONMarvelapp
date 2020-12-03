//
//  CharacterRepository.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func getCharacters(for serie: Serie, completion: @escaping([Actor]) -> Void)
}

class CharacterRepository {
  
    private var apiRepository: CharacterRepositoryProtocol = APICharacterRepository()
    
    /// Method that requests the characters
    /// - Parameter completion: completion
    func getCharacters(for serie: Serie, completion: @escaping ([Actor]) -> Void) {
        
        // 1. try to get the remote characters
        apiRepository.getCharacters(for: serie) { (characters) in
            
            // 2. return the characters
            completion(characters)
        }
    }
}
