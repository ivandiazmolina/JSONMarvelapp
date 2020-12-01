//
//  Threads.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 1/12/20.
//  Copyright © 2020 IDIAZM. All rights reserved.
//

import Foundation

/// Execute a function on UI Thread
/// - Parameter f: function
func ui(_ f: @escaping () -> Void) {
    
    DispatchQueue.main.async {
        f()
    }
}

/// Execute a function on Background Thread
/// - Parameter f: function
func background(_ f: @escaping () -> Void) {
    
    DispatchQueue.global(qos: .background).async {
        f()
    }
}

