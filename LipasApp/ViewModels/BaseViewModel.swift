//
//  ViewModel.swift
//  LipasApp
//
//  Created by Niko Lipponen on 22.7.2022.
//

import Foundation
import RxCocoa

/// Common ViewModel to be used in this project
class BaseViewModel {
    let showLoadingIcon = BehaviorRelay<Bool>(value: false)
    let showError = BehaviorRelay<Bool>(value: false)
}
