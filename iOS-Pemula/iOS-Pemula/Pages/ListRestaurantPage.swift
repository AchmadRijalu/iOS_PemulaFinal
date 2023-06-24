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
    @State var name:String?
    
    
    @ObservedObject var listRestaurantViewModel = ListRestaurantViewModel()
    @StateObject var detailRestaurantViewModel = DetailRestaurantViewModel()
    
    var body: some View {
        GeometryReader{reader in
            NavigationStack{
                if listRestaurantViewModel.isLoading {
                    ActivityIndicator(.constant(true), style: .large)
                                        .frame(width: 50, height: 50)
                                        .padding()
                } else {
                    // Render your content based on data
                    if listRestaurantViewModel.listRestaurant.isEmpty {
                        Text("No data available.")
                    } else {
                        ScrollView{
                            ForEach(listRestaurantViewModel.listRestaurant, id: \.id){ restaurant in
                                
                                ItemListRestaurant( id: restaurant.id,name: restaurant.name, pictureId: restaurant.pictureID, city: restaurant.city, rating: restaurant.rating, description: restaurant.description, detailRestaurantViewModel: detailRestaurantViewModel)
                            }
                            
                        }.padding(20).background(Color("Grey"))
                            .navigationTitle("Restaurants").padding(.bottom, 28)
                    }
                }
                
                
            }.background(Color("Grey")).onAppear(){
                listRestaurantViewModel.getRestaurantList()
            }
        }
    }
}

struct ListRestaurantPage_Previews: PreviewProvider {
    static var previews: some View {
        ListRestaurantPage()
    }
}



