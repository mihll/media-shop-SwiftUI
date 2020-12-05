//
//  MoviesTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct MoviesTab: View {
    @State var showSheetView = false
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        NavigationView {
            ScrollView(){
                MoviesCarousel(carouselTitle: "Nowe", carouselData: getNewMovieData(), carouselType: ProductType.movie, carouselListType: ProductListType.new)
                MoviesCarousel(carouselTitle: "Bestsellery", carouselData: getBestMovieData(), carouselType: ProductType.movie, carouselListType: ProductListType.best)
                MoviesCarousel(carouselTitle: "Polecane", carouselData: getRecommendedMoviewData(), carouselType: ProductType.movie, carouselListType: ProductListType.recommended)
            }.navigationBarTitle("Filmy")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showSheetView.toggle()
                                    }){
                                        if cart.items.isEmpty{
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                        } else {
                                            Text("Koszyk (\(cart.items.count))" )
                                            Image(systemName: "cart.fill").imageScale(.large)
                                        }
                                    }
            )
        }.sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
    }
    
    func getNewMovieData() -> [Movie] {
        return Array(movieData[0...4])
    }
    func getBestMovieData() -> [Movie] {
        return Array(movieData[5...9])
    }
    func getRecommendedMoviewData() -> [Movie] {
        return Array(movieData[10...14])
    }
}

struct MoviesTab_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            MoviesTab()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
