//
//  BaseViewController.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable {
    
    // MARK: Properties of NVActivityIndicatorView
    private let TEXT_LOADER = "Loading..."
    private let TYPE_LOADER: NVActivityIndicatorType = .ballPulseSync
    private let SIZE_LOADER = CGSize(width: 120, height: 120)
    private let PADDING_LOADER: CGFloat = 20
    private let COLOR_LOADER: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: functions
    
    /// show loading
    func showLoading() {
        ui { [weak self] in
            self?.startAnimating(self?.SIZE_LOADER, message: self?.TEXT_LOADER, type: self?.TYPE_LOADER, color: self?.COLOR_LOADER, padding: self?.PADDING_LOADER)
        }
    }
    
    /// hide loading
    func dismissLoading() {
        ui { [weak self] in
            self?.stopAnimating(.none)
        }
    }
    
    /// reload data of TableView
    func reloadData(tableView: UITableView) {
        ui {
            tableView.reloadData()
        }
    }

}
