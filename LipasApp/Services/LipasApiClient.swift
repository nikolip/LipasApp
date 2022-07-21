//
//  LipasApiClient.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Alamofire

class LipasApiClient {
    private let baseUrl = "http://lipas.cc.jyu.fi/api/sports-places"
    
    // MARK: - getSportPlaceSimpleList
    enum GetSportPlaceSimpleListFailureReason: Int, Error {
        case notFound = 404
        case emptyResponse = 460
    }
    
    typealias GetSportPlaceSimpleListResult = Result<[SportPlaceSimple], GetSportPlaceSimpleListFailureReason>
    typealias GetSportPlaceSimpleListCompletion = (_ result: GetSportPlaceSimpleListResult) -> Void
    
    func getSportPlaceSimpleList(completion: @escaping GetSportPlaceSimpleListCompletion) {
        //parameters are hard because this is example app.
        AF.request(baseUrl, parameters: ["fields": "name"])
            .validate()
            .responseDecodable(of: [SportPlaceSimple].self) { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(.emptyResponse))
                            return
                        }
                        let sportPlaceSimpleList = try JSONDecoder().decode([SportPlaceSimple].self, from: data)
                        completion(.success(sportPlaceSimpleList))
                    } catch {
                        completion(.failure(.notFound))
                    }
                case .failure:
                    completion(.failure(.notFound))
            }
        }
    }
    
    //MARK: - getSportPlaceDetails
    enum GetSportPlaceDetailsFailureReason: Int, Error {
        case notFound = 404
        case emptyResponse = 460
    }
    
    typealias GetSportPlaceDetailsResult = Result<SportPlaceDetails, GetSportPlaceDetailsFailureReason>
    typealias GetSportPlaceDetailsCompletion = (_ result: GetSportPlaceDetailsResult) -> Void

    func getSportPlaceDetails(sportsPlaceId : Int, completion: @escaping GetSportPlaceDetailsCompletion) {
        AF.request(baseUrl + "/\(sportsPlaceId)")
            .validate()
            .responseDecodable(of: SportPlaceDetails.self) { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(.emptyResponse))
                            return
                        }
                        let sportPlaceDetails = try JSONDecoder().decode(SportPlaceDetails.self, from: data)
                        completion(.success(sportPlaceDetails))
                    } catch {
                        completion(.failure(.notFound))
                    }
                case .failure:
                    completion(.failure(.notFound))
            }
        }
    }
}
