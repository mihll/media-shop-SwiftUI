//
//  BooksCarousel.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import SwiftUI

struct BooksCarousel: View {
    var carouselTitle: String
    var carouselData: [Book]
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
                    ForEach(carouselData) { book in
                        ProductTile(extraInfo: book.author, product: book)
                    }
                }
            }
        }
    }
}

struct BooksCarousel_Previews: PreviewProvider {
    static var previews: some View {
        BooksCarousel(carouselTitle: "Nowe", carouselData: bookData, carouselType: ProductType.book, carouselListType: ProductListType.new)
    }
}
