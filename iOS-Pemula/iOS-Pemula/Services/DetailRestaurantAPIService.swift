//
//  DetailRestaurantAPIService.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/06/23.
//

import Foundation
import Alamofire
import Combine
class DetailRestaurantAPIService {
    static let shared = DetailRestaurantAPIService()
    
    func fetchDetailRestaurantData(withID id: String, completion: @escaping (Result<GetDetailRestaurant, Error>) -> Void) {
        AF.request("https://restaurant-api.dicoding.dev/detail/\(id)")
            .validate()
            .responseDecodable(of: GetDetailRestaurant.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
