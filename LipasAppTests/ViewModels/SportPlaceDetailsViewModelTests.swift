//
//  SportPlaceTableViewModelTests.swift
//  LipasAppTests
//
//  Created by Niko Lipponen on 21.7.2022.
//

import XCTest
@testable import LipasApp


class SportPlaceDetailsViewModelTests : XCTestCase {
    
    //MARK: - getSportPlaceDetails
    func testGet() {
        
        let lipasApiClient = MockLipasApiClient()
        lipasApiClient.getSportPlaceDetailsResult = .success(SportPlaceDetails.createMock())
        
        let viewModel = SportPlaceDetailsViewModel(sportPlaceId: 1, lipasApiClient: lipasApiClient)
        
        //Value should be nil when initialized
        XCTAssertNil(viewModel.sportPlaceDetails.value)
    
        viewModel.getSportPlaceDetails()
        
        //Value should placed after succesful call
        XCTAssertNotNil(viewModel.sportPlaceDetails.value)
        
    }
}


private class MockLipasApiClient : LipasApiClient {
    var getSportPlaceDetailsResult: LipasApiClient.GetSportPlaceDetailsResult?
    
    override func getSportPlaceDetails(sportsPlaceId : Int, completion: @escaping LipasApiClient.GetSportPlaceDetailsCompletion) {
        completion(getSportPlaceDetailsResult!)
    }
}
