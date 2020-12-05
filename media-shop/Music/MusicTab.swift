//
//  MusicTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct MusicTab: View {
    @State var showSheetView = false
    @EnvironmentObject var cartItems: CartItems
    
    var body: some View {
        NavigationView {
            ScrollView() {
                MusicCarousel(carouselTitle: "Nowe", carouselData: getNewMusicData(), carouselType: ProductType.music, carouselListType: .new)
                MusicCarousel(carouselTitle: "Bestsellery", carouselData: getBestMusicData(), carouselType: ProductType.music, carouselListType: .best)
                MusicCarousel(carouselTitle: "Polecane", carouselData: getRecommendedMusicData(), carouselType: ProductType.music, carouselListType: .recommended)
            }.navigationBarTitle("Muzyka")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showSheetView.toggle()
                                    }){
                                        if cartItems.items.isEmpty{
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                        } else {
                                            Text("Koszyk (\(cartItems.items.count))" )
                                            Image(systemName: "cart.fill").imageScale(.large)
                                        }
                                    }
            )
        }.sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
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
