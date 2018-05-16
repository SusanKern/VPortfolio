//
//  ArtPortfolioTests.swift
//  ArtPortfolioTests
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import XCTest

class ArtPortfolioTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let dataController = DataController()
        
        let artist = dataController.artist
        let portfolio = dataController.portfolioContent
        
        XCTAssert(artist.firstName == "V")
        XCTAssert(portfolio.count > 0)
    }
}
