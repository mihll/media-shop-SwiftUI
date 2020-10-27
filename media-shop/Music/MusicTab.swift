//
//  MusicTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct MusicTab: View {
    var body: some View {
        NavigationView {
            ScrollView() {
                NavigationLink(destination: NewMusic()){
                    HStack() {
                        Text("Nowe")
                            .font(.title)
                            .padding(.leading)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ScrollView(.horizontal) {
                    HStack() {
                        ForEach(musicData) { music in
                            ContentTile(extraInfo: music.artist, content: music)
                        }
                    }
                }
                NavigationLink(destination: BestMusic()){
                    HStack() {
                        Text("Bestsellery")
                            .font(.title)
                            .padding(.leading)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ScrollView(.horizontal) {
                    HStack() {
                        ForEach(bestMusicData) { music in
                            ContentTile(extraInfo: music.artist, content: music)
                        }
                    }
                }
            }.navigationBarTitle("Muzyka")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CartView()){
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                    }
            )
        }
    }
}

struct MusicTab_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            MusicTab()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
