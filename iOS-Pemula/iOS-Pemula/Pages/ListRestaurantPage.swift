//
//  ListRestaurantPage.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI
import SwiftyJSON

struct ListRestaurantPage: View {
    var body: some View {
        GeometryReader{reader in
            NavigationStack{
              Text("Restaurants")
                    .navigationTitle("Restaurants")
    
            }
        }
    }
}

struct ListRestaurantPage_Previews: PreviewProvider {
    static var previews: some View {
        ListRestaurantPage()
    }
}
