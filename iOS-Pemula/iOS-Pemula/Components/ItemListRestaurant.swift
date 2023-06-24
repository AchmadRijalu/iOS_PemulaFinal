//
//  ItemListRestaurant.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemListRestaurant: View {
    var id:String
     var name:String
     var pictureId:String
     var city:String
     var rating:Double
    var description:String
    
    @ObservedObject var detailRestaurantViewModel: DetailRestaurantViewModel
    var body: some View {
        NavigationStack{
            NavigationLink(destination: DetailRestaurantPage(detailRestaurantViewModel: detailRestaurantViewModel, id: id)){
                VStack{
                    HStack{
                        WebImage(url: URL(string: "https://restaurant-api.dicoding.dev/images/small/\(pictureId)")).resizable().frame(width: 100, height: 100).cornerRadius(12)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("\(name)").font(.title3).fontWeight(.medium)
                                Spacer()
                                HStack{
                                    Image(systemName: "star.leadinghalf.filled").foregroundColor(Color("Orange"))
                                    Text("\(String(rating))")
                                }
                            }.padding(.bottom, 12).foregroundColor(.black)
                            HStack{
                                Text("\(description)").multilineTextAlignment(.leading).font(.callout).fontWeight(.regular).foregroundColor(.black)
                            }.padding(.bottom,4)
                            Text("\(city)").foregroundColor(.black).font(.caption).fontWeight(.semibold)
                        }
                        Spacer()
                    }
                }.padding(12).frame(maxWidth: .infinity, maxHeight: 140).background(Color("White")).cornerRadius(12)
            }
            
        }
        
    }
}
