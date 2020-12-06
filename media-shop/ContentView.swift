//
//  ContentView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var cart = Cart()
    var orderHistory = OrderHistory()
    var body: some View {
        TabView(selection: $selection){
            MusicTab()
                .tabItem {
                Label("Muzyka", systemImage: "music.note")
            }
            .tag(0)
            
            MoviesTab()
                .tabItem {
                    Label("Filmy", systemImage: "film")
            }
            .tag(1)
            
            BooksTab()
                .tabItem {
                    Label("Książki", systemImage: "books.vertical")
            }
            .tag(2)
            
            SearchTab()
                .tabItem {
                    Label("Szukaj", systemImage: "magnifyingglass")
            }
            .tag(3)
            
            OrdersTab()
                .tabItem {
                    Label("Zamówienia", systemImage: "bag")
            }
            .tag(4)
        }.environmentObject(cart)
        .environmentObject(orderHistory)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
