//
//  ListRestaurantModel.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import Foundation
import SwiftyJSON
import Alamofire


// MARK: - GetAllRestaurant
struct GetAllRestaurant: Codable, Hashable {
    
    var error: Bool
    var message: String
    var count: Int
    var restaurants: [GetAllRestaurantData]
}

// MARK: - Restaurant
struct GetAllRestaurantData: Codable, Hashable{
    var id, name, description, pictureID: String
    var city: String
    var rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case pictureID = "pictureId"
        case city, rating
    }
}
