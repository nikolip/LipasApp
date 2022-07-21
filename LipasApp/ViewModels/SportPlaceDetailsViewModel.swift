//
//  SportPlaceDetailsViewModel.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import RxSwift
import RxCocoa


class SportPlaceDetailsViewModel {
    let lipasApiClient : LipasApiClient
    var sportPlaceId : Int
    let showLoadingIcon = BehaviorRelay<Bool>(value: false)
    let sportPlaceDetails = BehaviorRelay<SportPlaceDetails?>(value: nil)
    
    init(sportPlaceId: Int, lipasApiClient: LipasApiClient = LipasApiClient()) {
        self.sportPlaceId = sportPlaceId
        self.lipasApiClient = lipasApiClient
    }
    
    func getSportPlaceDetails() {
        showLoadingIcon.accept(true)
        lipasApiClient.getSportPlaceDetails(sportsPlaceId: sportPlaceId,completion:{ [weak self] result in
            self?.showLoadingIcon.accept(false)
            switch result {
            case .success(let sportPlaceDetails):
                self?.sportPlaceDetails.accept(sportPlaceDetails)
            case .failure:
                self?.sportPlaceDetails.accept(nil)
            }
        })
    }
}
