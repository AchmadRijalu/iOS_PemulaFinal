//
//  CustomTabBar.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 21/06/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab:String
    
    var body: some View {
        HStack(spacing: 0){
            TabbarButton(image: "list.clipboard", selectedTab: $selectedTab)
            TabbarButton(image: "person", selectedTab: $selectedTab)
        }.padding().background(Color("Grey") .clipShape(TabCurve())).cornerRadius(30)
    }
}



struct TabbarButton:View{
    var image:String
    @Binding var selectedTab: String

    var body: some View{
        // getting mid point of each button for curve animation
        GeometryReader{reader in
            Button(action: {
                //change the tab bar here
                withAnimation{
                    selectedTab = image
                }
            }, label: {
                Image(systemName: "\(image)\(selectedTab == image ? ".fill": "")").font(.system(size: 25, weight: .semibold)).foregroundColor(Color("Purple")).offset(y: selectedTab == image ? -10 : 0)
            }).frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 30)
    }
}
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(""))
    }
}
