//
//  SimpleTableViewCell.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 3/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var mTextLabel: UILabel!
    
    // MARK: LETS and VARS
    static var cellIdentifier: String {
        return String(describing: SimpleTableViewCell.self)
    }
    
    // MARK: Methods
    
    /// method that updates UI
    /// - Parameter model: model with data
    func updateUI(model: Details.Models.DetailCellModel) {
                
        // Label
        switch model.type {
        case .serie:
            mTextLabel.text = model.serie?.name ?? ""
        default:
            mTextLabel.text = model.comic?.name ?? ""
        }
        
        mTextLabel.font = .systemFont(ofSize: 12)
    }
}
