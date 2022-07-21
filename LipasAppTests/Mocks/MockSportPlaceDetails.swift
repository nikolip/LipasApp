//
//  MockSportPlaceDetails.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
@testable import LipasApp


extension SportPlaceDetails {
    static func createMock(name: String = "mock-name", phoneNumber : String = "0400", location : Location = Location(address: "mock-address", city: City(name: "mock-city"), postalOffice: "mock-office", postalCode: "mock-postal") ) -> SportPlaceDetails {
        return SportPlaceDetails(name: name, phoneNumber: phoneNumber, location: location)
    }
}
