//
//  SeriesPresenterTests.swift
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

class SeriesPresenterTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SeriesPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupSeriesPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSeriesPresenter() {
        sut = SeriesPresenter()
    }
    
    // MARK: Test doubles
    
    class SeriesDisplayLogicSpy: SeriesDisplayLogic {
        
        var setupViewCalled = false
        var displayCharactersCalled = false
        
        func setupView(viewModel: Series.SetupView.ViewModel) {
            setupViewCalled = true
        }
        
        func displayCharacters() {
            displayCharactersCalled = true
        }
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = SeriesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.setupView(response: .init(title: "title"))
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "setupView should ask the viewController to setupView")
    }
    
    func testPresentCharacters() {
        // Given
        let spy = SeriesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.presentCharacters()
        
        // Then
        XCTAssertTrue(spy.displayCharactersCalled, "presentCharacters should ask the viewController to displayCharacters")
    }
}
