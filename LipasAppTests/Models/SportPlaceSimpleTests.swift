//
//  SportPlaceSimpleTests.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import XCTest
@testable import LipasApp

class SportPlaceSimpleTests : XCTestCase {
    /// Tests that model initialization works
    func testSportPlaceSimpleInit() {
        XCTAssertNotNil(SportPlaceSimple(name: "mock-name", sportsPlaceId: 1))
    }
}
