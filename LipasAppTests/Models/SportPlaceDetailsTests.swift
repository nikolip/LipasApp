//
//  SportPlaceSimpleTests.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import XCTest
@testable import LipasApp

class SportPlaceDetailsTests : XCTestCase {
    /// Tests that city model initialization works
    func testCityInit() {
        XCTAssertNotNil(City(name: "mock-city"))
    }
    
    /// Tests that location model initialization works
    func testLocationInit() {
        XCTAssertNotNil(Location(address: "mock-address", city: City(name: "mock-city"), postalOffice: "mock-office", postalCode: "mock-code"))
    }
    
    /// Tests that SportPlaceDetails model initialization works
    func testSportPlaceDetailsInit() {
        XCTAssertNotNil(SportPlaceDetails(name: "mock-name", phoneNumber: "0400123", location: Location(address: "mock-address", city: City(name: "mock-city"), postalOffice: "mock-office", postalCode: "mock-code")))
    }
    
}
