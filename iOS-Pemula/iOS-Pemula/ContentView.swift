//
//  ContentView.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var isDetailView = ViewState()
    @State var selectedTab = "list.clipboard"
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            Color("Grey").ignoresSafeArea().onAppear(){
                
            }
            VStack{
                if selectedTab == "list.clipboard"{
                    ListRestaurantPage()
                }
                else{
                    AboutPage()
                }
            }.onAppear(){
                
            }
            //Custom Tabbar here
            if isDetailView.isDetailView == true{
                //nothing
                
            }
            else{
                withAnimation(.spring()){
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
           
        })
        
        .environmentObject(isDetailView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
