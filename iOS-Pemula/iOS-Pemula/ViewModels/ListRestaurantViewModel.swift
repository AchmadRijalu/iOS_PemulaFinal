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


class ListRestaurantViewModel : ObservableObject{
    
    @Published var listRestaurant:[GetAllRestaurantData] = []
}


