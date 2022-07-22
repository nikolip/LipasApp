//
//  LipasAppUITests.swift
//  LipasAppUITests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import XCTest

class LipasAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationAndStrings() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Sport Places"].exists)
        
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        XCTAssertTrue(app.staticTexts["Details"].exists)
        XCTAssertTrue(app.staticTexts["name"].exists)
        XCTAssertTrue(app.staticTexts["address"].exists)
        XCTAssertTrue(app.staticTexts["postal office"].exists)
        XCTAssertTrue(app.staticTexts["postcode"].exists)
        XCTAssertTrue(app.staticTexts["city"].exists)
    }
}

