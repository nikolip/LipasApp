//
//  SportPlaceListViewModel.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import RxCocoa

class SportPlaceTableViewModel : BaseViewModel {
    var lipasApiClient : LipasApiClient
    let simpleSportPlaceList = BehaviorRelay<[SportPlaceSimple]>(value: [])

    init(lipasApiClient: LipasApiClient = LipasApiClient()) {
        self.lipasApiClient = lipasApiClient
    }
    
    func getSimpleSportPlaces() {
        showLoadingIcon.accept(true)
        showError.accept(false)
        
        lipasApiClient.getSportPlaceSimpleList(completion: { [weak self] result in
            self?.showLoadingIcon.accept(false)
            switch result {
            case .success(let places) :
                self?.simpleSportPlaceList.accept(places)
            case .failure :
                self?.simpleSportPlaceList.accept([])
                self?.showError.accept(true)
            }
        })
    }
}
