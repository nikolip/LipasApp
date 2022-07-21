//
//  MockSportPlaceSimple.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
@testable import LipasApp


extension SportPlaceSimple {
    static func createMock(sportsPlaceId: Int = 1, name: String = "mock-name") -> SportPlaceSimple {
        return SportPlaceSimple(name: name, sportsPlaceId: sportsPlaceId)
    }
}
