//
//  DetailRestaurantPage.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct DetailRestaurantPage: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var detailRestaurantViewModel: DetailRestaurantViewModel
    @EnvironmentObject var viewState: ViewState
    let id: String
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                VStack{
                    
                    if detailRestaurantViewModel.isLoading {
                        ActivityIndicator(.constant(true), style: .large)
                                            .frame(width: 50, height: 50)
                                            .padding()
                    } else {
                        // Render your content based on data
                        if detailRestaurantViewModel.detailData == nil {
                            Text("No data available.")
                        } else {
                            ScrollView{
                                HStack{
                                    WebImage(url: URL(string: "https://restaurant-api.dicoding.dev/images/large/\(detailRestaurantViewModel.detailData?.restaurant.pictureID ?? "")")).resizable().aspectRatio(contentMode: .fit)
                                }
                                
                                VStack{
                                    HStack{
                                        Text(detailRestaurantViewModel.detailData?.restaurant.name ?? "").font(.title).fontWeight(.medium)
                                        Spacer()
                                    }.padding(.bottom, 12)
                                    
                                    HStack{
                                        Spacer()
                                        VStack{
                                            Text(detailRestaurantViewModel.detailData?.restaurant.city ?? "").font(.headline)
                                            Text("Location").font(.subheadline).fontWeight(.light)
                                            
                                            
                                        }
                                        Spacer()
                                        VStack{
                                            HStack{
                                                
                                                Image(systemName: "star.leadinghalf.filled").foregroundColor(Color("Purple"))
                                                Text(String(detailRestaurantViewModel.detailData?.restaurant.rating ?? 0)).font(.headline)
                                            }
                                            Text("Ratings").font(.subheadline).fontWeight(.light)
                                            
                                        }
                                        
                                        Spacer()
                                    }.padding(.bottom , 12)
                                    
                                    //Categories
                                    VStack{
                                        HStack{
                                            Text("Categories").font(.title3).fontWeight(.regular)
                                            Spacer()
                                        }.padding(.bottom,4)
                                        ScrollView(.horizontal){
                                            HStack{
                                                ForEach(detailRestaurantViewModel.detailData?.restaurant.categories ?? [], id: \.self){cat in
                                                    Text(cat.name).padding(12).background(Color("Orange")).cornerRadius(14)
                                                }
                                            }.foregroundColor(.white).fontWeight(.medium)
                                        }
                                    }.padding(.bottom , 12)
                                    
                                    //Description
                                    
                                    
                                    //Menus
                                    VStack{
                                        HStack{
                                            Text("Menus").font(.title3).fontWeight(.regular)
                                            Spacer()
                                        }.padding(.bottom,4)
                                        ScrollView(.horizontal){
                                            HStack{
                                                ForEach(detailRestaurantViewModel.detailData?.restaurant.menus.foods ?? [], id: \.self){food in
                                                    Text(food.name).padding(12).background(Color("Orange")).cornerRadius(14)
                                                }
                                            
                                            }.foregroundColor(.white).fontWeight(.medium).padding(.bottom, 6)
                                        }
                                        ScrollView(.horizontal){
                                            HStack{
                                                ForEach(detailRestaurantViewModel.detailData?.restaurant.menus.drinks ?? [], id: \.self){drink in
                                                    Text(drink.name).padding(12).background(Color("Orange")).cornerRadius(14)
                                                }
                                               
                                            }.foregroundColor(.white).fontWeight(.medium).padding(.bottom, 6)
                                        }
                                    }.padding(.bottom,12)
                                    VStack{
                                        HStack{
                                            Text("Description").font(.title3).fontWeight(.regular)
                                            Spacer()
                                        }.padding(.bottom,4)
                                        HStack{
                                            Text(detailRestaurantViewModel.detailData?.restaurant.description ?? "")
                                        }.padding(.bottom, 6)
                                    }
                                }.padding(12)
                                
                                
                            }
                        }
                    }
                   
                        // Display the details using the fetched data
                       
                        
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("Grey")).edgesIgnoringSafeArea(.all)
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Place
                    BackButton(action: {
                        presentationMode.wrappedValue.dismiss() // Dismiss the current view and go back
                        viewState.isDetailView = false
                    })
                }
            }
        }.onAppear {
            detailRestaurantViewModel.fetchDetailRestaurantData(withID: id)
            viewState.isDetailView = true
            
        }
        
    }
    
    
    
    struct BackButton: View {
        let action: () -> Void
        
        var body: some View {
            HStack(alignment: .center){
                
                Button(action: action) {
                    Spacer()
                    Image(systemName: "chevron.left").foregroundColor(Color("Purple"))
                    
                }.background(.white).cornerRadius(50).frame(width: 30, height: 30)
                
            }
        }
    }
}
