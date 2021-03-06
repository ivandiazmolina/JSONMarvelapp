//
//  CharactersInteractorTests.swift
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

class CharactersInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: CharactersInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupCharactersInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCharactersInteractor() {
        sut = CharactersInteractor()
    }
    
    // MARK: Test doubles
    
    class CharactersPresentationLogicSpy: CharactersPresentationLogic {
        
        var setupViewCalled = false
        var presentCharactersCalled = false
        var presentDetailsCalled = false
        var presentEmptyViewCalled = false
        var displayLoadingCalled = false
        
        func setupView(response: Characters.SetupView.Response) {
            setupViewCalled = true
        }
        
        func presentCharacters() {
            presentCharactersCalled = true
        }
        
        func presentDetails(response: Characters.DidSelectedItem.Response) {
            presentDetailsCalled = true
        }
        
        func presentEmptyView() {
            presentEmptyViewCalled = true
        }
        
        func displayLoading(_ show: Bool) {
            displayLoadingCalled = true
        }
        
        
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = CharactersPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.serie = createTestSerie()
        sut.setupView()
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "setupView should ask the presenter to setupView")
    }
    
    func testDidSelectedItemAt() {
        // Given
        let spy = CharactersPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.characters = [createTestActors(), createTestActors()]
        sut.didSelectedItemAt(index: 0)
        
        // Then
        XCTAssertTrue(spy.presentDetailsCalled, "didSelectedItemAt should ask the presenter to presentDetailsCalled")
    }
    
    func testCharactersCount() {
        // Given
        let spy = CharactersPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.characters = [createTestActors(), createTestActors()]
        let count = sut.getCharactersCount()
        
        // Then
        XCTAssertEqual(sut.characters?.count, count, "Check if count is equal to array count")
    }
    
    func testGetCharacterCellFor() {
        // Given
        let spy = CharactersPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.characters = [createTestActors(), createTestActors()]
        let cell = sut.getCharacterCellFor(index: 0)
        
        // Then
        XCTAssertEqual(cell.character?.id, 1, "Check if id is equal to 0")
    }
    
    // MARK: private methods
    fileprivate func createTestActors() -> Actor {
        var actor = Actor()
        
        actor.id = 1
        actor.name = "name"
        actor.thumbnail = Thumbail()
        
        return actor
    }
    
    fileprivate func createTestSerie() -> Serie {
        var serie = Serie()
        
        serie.id = 1
        serie.title = "title"
        serie.thumbnail = Thumbail()
        
        return serie
    }
}
