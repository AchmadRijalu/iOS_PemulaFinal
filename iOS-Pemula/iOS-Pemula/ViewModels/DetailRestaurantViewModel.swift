//
//  DetailRestaurantViewModel.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/06/23.
//

import Foundation
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON
import Combine


class DetailRestaurantViewModel: ObservableObject {
    @Published var detailData: GetDetailRestaurant?
    @Published var isLoading = false
    
    init() {
        self.detailData = detailData
    }
    func fetchDetailRestaurantData(withID id: String) {
        isLoading = true
        DetailRestaurantAPIService.shared.fetchDetailRestaurantData(withID: id) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.detailData = data
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
}
