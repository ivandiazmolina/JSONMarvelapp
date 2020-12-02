//
//  SerieTableViewCell.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 2/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {

    
    // MARK: IBOutlets
    @IBOutlet weak var serieNameLabel: UILabel!
    
    // MARK: LETS and VARS
    private var serie: Serie?
    
    static var cellIdentifier: String {
        return String(describing: SerieTableViewCell.self)
    }
    
    func updateUI(model: Series.Models.SerieCellModel) {
        
        serie = model.serie
        
        serieNameLabel.text = serie?.title
    }
    
}
