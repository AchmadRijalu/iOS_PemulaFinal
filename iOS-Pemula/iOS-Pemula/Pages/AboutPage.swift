//
//  AboutPage.swift
//  iOS-Pemula
//
//  Created by Achmad Rijalu on 24/05/23.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                VStack {
                    HStack{
                        Image("circlephoto").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200)
                    }.padding(.top, 70)
                    
                    VStack(spacing: 20){
                        HStack{
                            Text("Achmad Rijalu").font(.title2).fontWeight(.medium)
                            
                        }
                        HStack(alignment: .center){
                            Text("iOS Developer Intern at Apple Developer Academy @UC").font(.title3).fontWeight(.medium).multilineTextAlignment(.center)
                            
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        Spacer()
                        Button(action: {
                            // Button action
                            openEmailApp()
                        }) {
                            Text("Contact Me").fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 2) // Adjust padding as needed
                                .padding()
                                .background(Color("Purple"))
                                .cornerRadius(16)
                        }
                        Spacer()
                    }
                    
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color("White"))
                    .navigationTitle("About").navigationBarTitleDisplayMode(.automatic)
            }
            
        }
        
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
func openEmailApp() {
    if let url = URL(string: "mailto:achmad.rijalu@gmail.com") {
        UIApplication.shared.open(url)
    }
}
