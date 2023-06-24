// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getDetailRestaurant = try? JSONDecoder().decode(GetDetailRestaurant.self, from: jsonData)

import Foundation

// MARK: - GetDetailRestaurant
struct GetDetailRestaurant: Codable {
    var error: Bool
    var message: String
    var restaurant: GetDetailRestaurantData
}

// MARK: - Restaurant
struct GetDetailRestaurantData: Codable {
    var id, name, description, city: String
    var address, pictureID: String
    var categories: [Category]
    var menus: Menus
    var rating: Double
    var customerReviews: [CustomerReview]

    enum CodingKeys: String, CodingKey {
        case id, name, description, city, address
        case pictureID = "pictureId"
        case categories, menus, rating, customerReviews
    }
}

// MARK: - Category
struct Category: Codable, Hashable {
    var name: String
}

// MARK: - CustomerReview
struct CustomerReview: Codable, Hashable {
    var name, review, date: String
}

// MARK: - Menus
struct Menus: Codable , Hashable{
    var foods, drinks: [Category]
}
