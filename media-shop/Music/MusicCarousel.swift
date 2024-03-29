//
//  MusicCarousel.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 29/10/2020.
//

import SwiftUI

struct MusicCarousel: View {
    var carouselTitle: String
    var carouselData: [Music]
    var carouselType: ProductType
    var carouselListType: ProductListType
    
    var body: some View {
        VStack(){
            NavigationLink(destination: ProductList(productType: carouselType, productListType: carouselListType, productListName: carouselTitle)){
                HStack() {
                    Text(carouselTitle)
                        .font(.title)
                        .padding(.leading)
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(carouselData) { music in
                        ProductTile(extraInfo: music.artist, product: music)
                    }
                }
            }
        }
    }
}

struct MusicCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MusicCarousel(carouselTitle: "Test", carouselData: musicData, carouselType: ProductType.music, carouselListType: ProductListType.new)
    }
}
