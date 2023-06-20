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
    let error: Bool
    let message: String
    let count: Int
    let restaurants: [GetAllRestaurantData]
}

// MARK: - Restaurant
struct GetAllRestaurantData: Codable, Hashable {
    let id, name, description, pictureID: String
    let city: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case pictureID = "pictureId"
        case city, rating
    }
}
