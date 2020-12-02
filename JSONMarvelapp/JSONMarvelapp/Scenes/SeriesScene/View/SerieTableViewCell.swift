//
//  SerieTableViewCell.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit
import SDWebImage

class SerieTableViewCell: UITableViewCell {

    
    // MARK: IBOutlets
    @IBOutlet weak var serieNameLabel: UILabel!
    @IBOutlet weak var serieImageView: UIImageView!
    
    // MARK: LETS and VARS
    private var serie: Serie?
    
    static var cellIdentifier: String {
        return String(describing: SerieTableViewCell.self)
    }
    
    func updateUI(model: Series.Models.SerieCellModel) {
        
        serie = model.serie
        
        // Label
        serieNameLabel.text = serie?.title
        serieNameLabel.textColor = .white
        serieNameLabel.font = .boldSystemFont(ofSize: 18)
        
        // ImageView
        serieImageView.sd_setImage(with: URL(string: serie?.image ?? "")) { [weak self] (image, error, cacheType, url) in
            guard let image = image else { return }
            
            self?.serieImageView.image = image
            self?.serieImageView.backgroundColor = .clear
        }
    }
    
}
