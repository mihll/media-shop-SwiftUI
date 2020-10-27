//
//  ContentView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection){
            MusicTab()
                .tabItem {
                    VStack {
                        Image(systemName: "music.note")
                        Text("Muzyka")
                    }
            }
            .tag(0)
            
            MoviesTab()
                .tabItem {
                    VStack {
                        Image(systemName: "film")
                        Text("Filmy")
                    }
            }
            .tag(1)
            
            BooksTab()
                .tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                        Text("Książki")
                    }
            }
            .tag(2)
            
            SearchTab()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Szukaj")
                    }
            }
            .tag(3)
            
            ProfileTab()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profil")
                    }
            }
            .tag(4)
        }.navigationViewStyle(StackNavigationViewStyle())
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
