//
//  SeriesViewControllerTests.swift
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

class SeriesViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: SeriesViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupSeriesViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSeriesViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Series", bundle: bundle)
        sut = storyboard.instantiateInitialViewController()?.children.getElement(0) as? SeriesViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class SeriesBusinessLogicSpy: SeriesBusinessLogic {
        
        var setupViewCalled = false
        var didSelectedItemAtCalled = false
        var setSeriesCalled = false
        var getSeriesCountCalled = false
        var getSeriesCellForCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func didSelectedItemAt(index: Int) {
            didSelectedItemAtCalled = true
        }
        
        func setSeries(_ series: [Serie]) {
            setSeriesCalled = true
        }
        
        func getSeriesCount() -> Int {
            getSeriesCountCalled = true
            return 0
        }
        
        func getSerieCellFor(index: Int) -> Series.Models.SerieCellModel {
            getSeriesCellForCalled = true
            return .init()
        }
    }
    
    // MARK: Tests
    
    func testSetupView() {
        // Given
        let spy = SeriesBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.setupViewCalled, "viewDidLoad() should ask the interactor to setupView")
    }
    
    func testNumberOfRowsInSection() {
        // Given
        let spy = SeriesBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        
        let series = [createTestSerie(), createTestSerie()]
        
        sut.fetchedSeries(series: series)
        
        _ = sut.tableView(sut.seriesTableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertTrue(spy.getSeriesCountCalled, "numberOfRowsInSection should ask the interactor to getSeriesCount")
    }
    
    func testCellForRow() {
        // Given
        let spy = SeriesBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        
        let series = [createTestSerie(), createTestSerie()]
        
        sut.fetchedSeries(series: series)
        
        _ = sut.tableView(sut.seriesTableView, cellForRowAt: IndexPath(item: 0, section: 0))
        
        // Then
        XCTAssertTrue(spy.getSeriesCellForCalled, "cellForRowAt should ask the interactor to getSeriesCellFor")
    }
    
    func testDidSelectedItemAt() {
        // Given
        let spy = SeriesBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.setupView(viewModel: .init())
        
        let series = [createTestSerie(), createTestSerie()]
        
        sut.fetchedSeries(series: series)
        
        sut.tableView(sut.seriesTableView, didSelectRowAt: IndexPath(item: 0, section: 0))
        
        // Then
        XCTAssertTrue(spy.didSelectedItemAtCalled, "didSelected should ask the interactor to didSelectedItemAt")
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