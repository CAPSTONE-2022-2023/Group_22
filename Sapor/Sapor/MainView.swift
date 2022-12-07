//
//  DashboardView.swift
//  Sapor
//
//  Created by Alireza Zahedi on 2022-11-15.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: String = "dashboard";
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }
                .tag("menu")
            
            BasketView()
                .tabItem {
                    Label("Basket", systemImage: "basket")
                }
                .tag("basket")
            
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "person.fill")
                }
                .tag("dashboard")
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
