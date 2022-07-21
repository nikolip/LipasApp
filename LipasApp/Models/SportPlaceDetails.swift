//
//  SportPlaceDetailsModel.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation

struct SportPlaceDetails : Codable {
    var name : String?
    var phoneNumber : String?
    var location : Location
}

struct Location : Codable {
    var address : String?
    var city : City?
    var postalOffice : String?
    var postalCode : String?
}

struct City : Codable {
    var name : String?
}

