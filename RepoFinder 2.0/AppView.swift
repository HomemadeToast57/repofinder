//
//  AppView.swift
//  RepoFinder 2.0
//
//  Created by Jacob Singer on 9/29/21.
//  Copyright © 2021 Jacob Singer. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
                    ContentView()
                        .tabItem {
                            if #available(iOS 14.0, *) {
                                Label("Repos", systemImage: "magnifyingglass")
                            } else {
                                // Fallback on earlier versions
                            }
                        }
            
                    SettingsView()
                .tabItem {
                    if #available(iOS 14.0, *) {
                        Label("Settings", systemImage: "gear")
                    } else {
                        // Fallback on earlier versions
                    }
                }
                }
            }
    }


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
