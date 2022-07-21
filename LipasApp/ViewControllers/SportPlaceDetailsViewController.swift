//
//  SportPlaceDetailsViewController.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import UIKit
import RxSwift

class SportPlaceDetailsViewController : UIViewController {
    
    @IBOutlet weak var detailsStackview: UIStackView!
    var viewModel: SportPlaceDetailsViewModel?
    private let disposeBag = DisposeBag()
    
    var nameView, phoneNumberView, addressView , postalOfficeView, postalCodeView, cityNameView : SportPlaceSingleDetailView!
    
    private let missingFieldText = "--";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add details
        initiateDetailViews()
        configureAndAddDetailView(title: "name", detailView: nameView)
        configureAndAddDetailView(title: "phonenumber", detailView: phoneNumberView)
        configureAndAddDetailView(title: "address", detailView: addressView)
        configureAndAddDetailView(title: "postal office", detailView: postalOfficeView)
        configureAndAddDetailView(title: "postcode", detailView: postalCodeView)
        configureAndAddDetailView(title: "city", detailView: cityNameView)
        
        bindDetailValues()
        
        viewModel?.getSportPlaceDetails()
        
    }
    
    private func bindDetailValues() {
        viewModel?.sportPlaceDetails.asObservable()
            .subscribe(onNext: { placeInfo in
                self.nameView.valueLabel.text = placeInfo?.name ?? self.missingFieldText
                self.phoneNumberView.valueLabel.text = placeInfo?.phoneNumber ?? self.missingFieldText
                self.addressView.valueLabel.text = placeInfo?.location.address ?? self.missingFieldText
                self.postalOfficeView.valueLabel.text = placeInfo?.location.postalOffice ?? self.missingFieldText
                self.postalCodeView.valueLabel.text = placeInfo?.location.postalCode ?? self.missingFieldText
                self.cityNameView.valueLabel.text = placeInfo?.location.city?.name ?? self.missingFieldText
            }).disposed(by: disposeBag)
    }
    
    private func initiateDetailViews() {
        nameView = SportPlaceSingleDetailView()
        phoneNumberView = SportPlaceSingleDetailView()
        addressView = SportPlaceSingleDetailView()
        postalOfficeView = SportPlaceSingleDetailView()
        postalCodeView = SportPlaceSingleDetailView()
        cityNameView = SportPlaceSingleDetailView()
    }
       
    private func configureAndAddDetailView(title: String, detailView: SportPlaceSingleDetailView) {
        detailView.valueLabel.numberOfLines = 0
        detailView.valueLabel.lineBreakMode = .byWordWrapping
        detailView.titleLabel.text = title
        detailsStackview.addArrangedSubview(detailView)
    }
}
