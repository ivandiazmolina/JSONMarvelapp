//
//  DetailsPresenter.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 3/12/20.
//  Copyright (c) 2020 IDIAZM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailsPresentationLogic {
    func setupView(response: Details.SetupView.Response)
}

class DetailsPresenter: DetailsPresentationLogic {

  weak var viewController: DetailsDisplayLogic?
    
    func setupView(response: Details.SetupView.Response) {
        
        
        let viewModel = Details.SetupView.ViewModel()
        
        viewController?.setupView(viewModel: viewModel)
    }
    
}
