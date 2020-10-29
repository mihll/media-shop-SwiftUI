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
                MusicCarousel(carouselTitle: "Nowe", carouselData: getNewMusicData())
                MusicCarousel(carouselTitle: "Bestsellery", carouselData: getBestMusicData())
                MusicCarousel(carouselTitle: "Polecane", carouselData: getRecommendedMusicData())
            }.navigationBarTitle("Muzyka")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CartView()){
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                    }
            )
        }
    }
    
    func getNewMusicData() -> [Music] {
        return Array(musicData[0...4])
    }
    func getBestMusicData() -> [Music] {
        return Array(musicData[5...9])
    }
    func getRecommendedMusicData() -> [Music] {
        return Array(musicData[10...14])
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
