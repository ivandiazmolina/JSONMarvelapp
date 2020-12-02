//
//  CharacterCollectionViewCell.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    
    static var cellIdentifier: String {
        return String(describing: CharacterCollectionViewCell.self)
    }
    
    func updateUI(model: Characters.Models.CharacterCellModel) {
        
        guard let url = URL(string: model.character?.image ?? "") else { return }
        
        characterImageView.sd_setImage(with: url) { [weak self] (image, error, cacheType, url) in
            guard let image = image else { return }
            
            self?.characterImageView.image = image
            self?.characterImageView.backgroundColor = .clear
        }
    }

}
