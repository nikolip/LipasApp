//
//  SportPlaceTableViewModelTests.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import XCTest
@testable import LipasApp


class SportPlaceTableViewModelTests : XCTestCase {
    
    //MARK: - getSimpleSportPlaces
    func testGetSimpleSportPlaces() {
        
        let lipasApiClient = MockLipasApiClient()
        lipasApiClient.getSportPlaceSimpleListResult = .success([SportPlaceSimple.createMock()])
        
        let viewModel = SportPlaceTableViewModel(lipasApiClient: lipasApiClient)
        
        //Value should be empty when initialized
        XCTAssertTrue(viewModel.simpleSportPlaceList.value.isEmpty)
        XCTAssertFalse(lipasApiClient.isGetSportPlaceSimpleListcalled)
        
        viewModel.getSimpleSportPlaces()
        
        //List should contain 1 item
        XCTAssertTrue(viewModel.simpleSportPlaceList.value.count == 1)
        XCTAssertTrue(lipasApiClient.isGetSportPlaceSimpleListcalled)
    }
}


private class MockLipasApiClient : LipasApiClient {
    var getSportPlaceSimpleListResult: LipasApiClient.GetSportPlaceSimpleListResult?
    var isGetSportPlaceSimpleListcalled = false
    
    override func getSportPlaceSimpleList(completion: @escaping LipasApiClient.GetSportPlaceSimpleListCompletion) {
        isGetSportPlaceSimpleListcalled = true
        completion(getSportPlaceSimpleListResult!)
    }
}
