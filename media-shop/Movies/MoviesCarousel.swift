//
//  MoviesCarousel.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 18/11/2020.
//

import SwiftUI

struct MoviesCarousel: View {
    var carouselTitle: String
    var carouselData: [Movie]
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
                    ForEach(carouselData) { movie in
                        ProductTile(extraInfo: movie.director, product: movie)
                    }
                }
            }
        }
    }
}

struct MoviesCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCarousel(carouselTitle: "Nowe", carouselData: movieData, carouselType: ProductType.movie, carouselListType: ProductListType.new)
    }
}
