//
//  SeriesInteractorTests.swift
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

class SeriesInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SeriesInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupSeriesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSeriesInteractor() {
        sut = SeriesInteractor()
    }
    
    // MARK: Test doubles
    
    class SeriesPresentationLogicSpy: SeriesPresentationLogic {
        
        var setupViewCalled = false
        var presentCharactersCalled = false
        
        func setupView(response: Series.SetupView.Response) {
            setupViewCalled = true
        }
        
        func presentCharacters() {
            presentCharactersCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testDidSelectedItemAt() {
        // Given
        let spy = SeriesPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.series = [createTestSerie()]
        sut.didSelectedItemAt(index: 0)
        
        // Then
        XCTAssertTrue(spy.presentCharactersCalled, "didSelectedItemAt should ask the presenter to presentCharacters")
    }
    
    func testSetGetSeries() {
        // Given
        let spy = SeriesPresentationLogicSpy()
        sut.presenter = spy
        let series = [createTestSerie(), createTestSerie()]
        
        // When
        sut.setSeries(series)
        
        // Then
        XCTAssertEqual(series.count, sut.getSeriesCount(), "Check if array setSeries count is same getSeriesCount")
    }
    
    func testGetSeriesCellFor() {
        // Given
        let spy = SeriesPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.setSeries([createTestSerie(), createTestSerie()])
        let serie = sut.getSerieCellFor(index: 0)
        
        // Then
        XCTAssertEqual(serie.serie?.title, "title", "Check if title of element is equals to 'title'")
    }
    
    // MARK: private methods
    fileprivate func createTestSerie() -> Serie {
        var serie = Serie()
        
        serie.id = 1
        serie.title = "title"
        serie.thumbnail = Thumbail()
        
        return serie
    }
}
