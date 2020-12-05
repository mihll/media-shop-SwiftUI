//
//  ProductList.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 29/10/2020.
//

import SwiftUI

enum ProductListType {
    case new
    case best
    case recommended
}

struct ProductList: View {
    var productType: ProductType
    var productListType: ProductListType
    var productListName: String
    @State var showSheetView = false
    @EnvironmentObject var cart: Cart
    var body: some View {
        List() {
            switch productType {
            case .music:
                ForEach(getMusicProduct(listType: productListType)) { music in
                    MusicListRow(musicItem: music)
                }
            case .movie:
                ForEach(getMoviesProduct(listType: productListType)) { movie in
                    MoviesListRow(movieItem: movie)
                }
            case .book:
                ForEach(getBooksProduct(listType: productListType)) { book in
                    BooksListRow(bookItem: book)
                }
            }
        }.navigationBarTitle(productListName, displayMode: .inline)
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
        .sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
    }
}

func getMusicProduct(listType: ProductListType) -> [Music] {
    switch listType {
    case .new:
        return musicData.shuffled()
    case .best:
        return musicData.shuffled()
    case .recommended:
        return musicData.shuffled()
    }
}

func getMoviesProduct(listType: ProductListType) -> [Movie] {
    switch listType {
    case .new:
        return movieData.shuffled()
    case .best:
        return movieData.shuffled()
    case .recommended:
        return movieData.shuffled()
    }
}

func getBooksProduct(listType: ProductListType) -> [Book] {
    switch listType {
    case .new:
        return bookData.shuffled()
    case .best:
        return bookData.shuffled()
    case .recommended:
        return bookData.shuffled()
    }
}


struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList(productType: ProductType.music, productListType: ProductListType.new, productListName: "Nowa muzyka")
    }
}
