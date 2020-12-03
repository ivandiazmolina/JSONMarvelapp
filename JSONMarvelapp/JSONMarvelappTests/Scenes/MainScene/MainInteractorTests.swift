//
//  MainInteractorTests.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 3/12/20.
//  Copyright (c) 2020 IDIAZM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import JSONMarvelapp
import XCTest

class MainInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MainInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupMainInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainInteractor() {
        sut = MainInteractor()
    }
    
    // MARK: Test doubles
    
    class MainPresentationLogicSpy: MainPresentationLogic {
        
        var setupViewCalled = false
        var presentSeriesCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func presentSeries(response: Main.loadInitialData.Response) {
            presentSeriesCalled = true
        }
    }
    
    // MARK: Tests
}