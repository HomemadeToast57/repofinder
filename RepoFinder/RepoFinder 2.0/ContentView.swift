//
//  ContentView.swift
//  RepoFinder 2.0
//
//  Created by Jacob Singer on 12/2/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct ContentView: View {

    //MARK: - customizing nav bar

    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor(named: "jpurple")
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "jpurple")]
    }
    
    @EnvironmentObject var networkManager: NetworkManager
    
    var managers = ["Cydia", "Sileo", "Zebra", "Installer"]

    @State private var selectedManager = 0
    
    
    var pickerVal = 0
    
    
    var managerURL: String {
        
        switch selectedManager {
        case 0: return "cydia://url/https://cydia.saurik.com/api/share#?source="
        case 1:
            return "sileo://source/"
        case 2:
            return "zbra://sources/add/"
        case 3:
            return "installer://add/repo="
        default:
            return "cydia://url/https://cydia.saurik.com/api/share#?source="
        }
    }
    
    var body: some View {


        NavigationView {

            VStack {


                //

                List {

                    Picker(selection: $selectedManager, label: Text("")) {
                        ForEach(0 ..< managers.count) {
                            Text(self.managers[$0])



                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.bottom, 5)
                        .padding(.top, 5)

                    ForEach(networkManager.repos, id: \.self) { repo in
                        
                        
                        
                        HStack {
                            WebImage(url: URL(string: "\(repo.url)/CydiaIcon.png"))
                                .onSuccess { image, cacheType in
                                    // Success
                            }

                            .resizable()
                            .placeholder(Image("RFIcon"))
                                .frame(width: 50, height: 50)// Resizable like SwiftUI.Image
                                .cornerRadius(12)
                            // Supports ViewBuilder as well
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(repo.name).bold().font(.headline)
                                    Button(""){
                                        
                                        if let url = URL(string: self.managerURL + repo.url) {
                                            UIApplication.shared.open(url)
                                        }
                                        
                                        
                                    }
                                }
                                HStack {
                                    Text(repo.url).foregroundColor( .gray)
                                    
                                    Spacer()
                                    Text(repo.packages).padding(.trailing, 0).font(.system(size: 10))
                                    
                                }
                            }
                        }.padding(.vertical, 10)
                    }
                    //                    Image(systemName: "magnifyingglass.circle.fill").foregroundColor(Color("jpurple"))
                    //                    .position(x: 300, y: 40)
                    
                }.navigationBarTitle("RepoFinder ", displayMode: .automatic)
                
                
                
            }
        }.edgesIgnoringSafeArea(.top)
.navigationViewStyle(StackNavigationViewStyle())

        
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

