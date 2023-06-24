//
//  ListRestaurantViewModel.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 14/06/23.
//

import Foundation
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON
import Combine


class ListRestaurantViewModel : ObservableObject{
    
    @Published var listRestaurant:[GetAllRestaurantData] = []
    @Published var restaurantListLoadingError: String = ""
    @Published var showAlert: Bool = false
    @Published var isLoading = false
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: ListRestaurantServiceProtocol
    
    init( dataManager: ListRestaurantServiceProtocol = ListRestaurantAPIService.shared) {
        self.dataManager = dataManager
        getRestaurantList()
        
    }
    
    func getRestaurantList() {
        isLoading = true
        dataManager.fetchListRestaurant()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.createAlert(with: dataResponse.error!)
                } else {
                    self.listRestaurant = dataResponse.value!.restaurants
                    self.isLoading = false
                }
            }.store(in: &cancellableSet)
       
    }
    
    func createAlert( with error: NetworkError ) {
        restaurantListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}




