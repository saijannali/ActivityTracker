//
//  MainTabView.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ActivitySummaryView()
                .tabItem {
                    Label("Summary", systemImage: "list.bullet")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
