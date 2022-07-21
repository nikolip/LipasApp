//
//  SportPlaceDetailsViewController.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import UIKit


class SportPlaceDetailsViewController : UIViewController {
    
    @IBOutlet weak var detailsStackview: UIStackView!
    var viewModel: SportPlaceDetailsViewModel?
    
    var nameView, phoneNumberView, addressView , postalOfficeView, postalCodeView, cityNameView : SportPlaceSingleDetailView!
    
    
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
