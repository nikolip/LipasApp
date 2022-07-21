//
//  SportPlaceListViewModel.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import RxRelay

class SportPlaceTableViewModel {
    var lipasApiClient : LipasApiClient
    let simpleSportPlaceList = BehaviorRelay<[SportPlaceSimple]>(value: [])
    let showLoadingIcon = BehaviorRelay<Bool>(value: false)
    
    init(lipasApiClient: LipasApiClient = LipasApiClient()) {
        self.lipasApiClient = lipasApiClient
    }
    
    func getSimpleSportPlaces() {
        showLoadingIcon.accept(true)
        lipasApiClient.getSportPlaceSimpleList(completion: { [weak self] result in
            self?.showLoadingIcon.accept(false)
            
            switch result {
            case .success(let places) :
                self?.simpleSportPlaceList.accept(places)
            case .failure :
                //TODO - handle errors here. Show error text
                self?.simpleSportPlaceList.accept([])
            }
        })
    }
}
