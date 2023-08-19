//
//  ListRestaurantAPIService.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 14/06/23.
//

import Foundation
import Alamofire
import Combine

protocol ListRestaurantServiceProtocol{
    func fetchListRestaurant() -> AnyPublisher<DataResponse<GetAllRestaurant, NetworkError>, Never>
}


class ListRestaurantAPIService{
    static let shared:ListRestaurantServiceProtocol = ListRestaurantAPIService()
    private init(){
        
    }
}
extension ListRestaurantAPIService: ListRestaurantServiceProtocol{
    
    func fetchListRestaurant() -> AnyPublisher<DataResponse<GetAllRestaurant, NetworkError>, Never> {
        let url = URL(string: "https://restaurant-api.dicoding.dev/list")!
        
        return AF.request(url,method: .get)
                    .validate()
                    .publishDecodable(type: GetAllRestaurant.self)
                    .map { response in
                        response.mapError { error in
                            let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                            return NetworkError(initialError: error, backendError: backendError)
                        }
                    }
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
            }
    }


