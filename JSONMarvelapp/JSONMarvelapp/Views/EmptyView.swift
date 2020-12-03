//
//  EmptyView.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 3/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit

class EmptyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
        setupView()
    }
    
    fileprivate func setupView() {
        print(#function)
    }

}
