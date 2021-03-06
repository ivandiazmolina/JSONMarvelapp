//
//  CharactersViewControllerTests.swift
//  JSONMarvelapp
//
//  Created by Iván Díaz Molina on 4/12/20.
//  Copyright (c) 2020 IDIAZM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import JSONMarvelapp
import XCTest

class CharactersViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: CharactersViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupCharactersViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCharactersViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Characters", bundle: bundle)
        sut = storyboard.instantiateInitialViewController() as? CharactersViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class CharactersBusinessLogicSpy: CharactersBusinessLogic {
        
        var setupViewCalled = false
        var didSelectedItemAtCalled = false
        var getCharactersCountCalled = false
        var getCharacterCellForCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func didSelectedItemAt(index: Int) {
            didSelectedItemAtCalled = true
        }
        
        func getCharactersCount() -> Int {
            getCharactersCountCalled = true
            return 0
        }
        
        func getCharacterCellFor(index: Int) -> Characters.Models.CharacterCellModel {
            getCharacterCellForCalled = true
            return .init()
        }
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = CharactersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "viewDidLoad() should ask the interactor to setupView")
    }
    
    func testDisplayEmptyState() {
        // Given
        let spy = CharactersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.displayEmptyState()
        
        // Then
        XCTAssertFalse(sut.emptyView.isHidden, "displayEmptyState check isHidden on emptyView")
    }
    
    func testNumberOfItemsInSection() {
        // Given
        let spy = CharactersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        _ = sut.collectionView(sut.charactersCollectionView, numberOfItemsInSection: 0)
        
        // Then
        XCTAssertTrue(spy.getCharactersCountCalled, "numberOfItemsInSection should ask the interactor to getCharactersCount")
    }
    
    func testCellForItemAt() {
        // Given
        let spy = CharactersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        _ = sut.collectionView(sut.charactersCollectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertTrue(spy.getCharacterCellForCalled, "cellForItemAt should ask the interactor to getCharacterCellFor")
    }
    
    func testDidSelectItemAt() {
        // Given
        let spy = CharactersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        _ = sut.collectionView(sut.charactersCollectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertTrue(spy.didSelectedItemAtCalled, "didSelectItemAt should ask the interactor to didSelectedItemAt")
    }
}
