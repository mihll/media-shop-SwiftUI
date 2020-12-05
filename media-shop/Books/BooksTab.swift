//
//  BooksTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct BooksTab: View {
    @State var showSheetView = false
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        NavigationView {
            ScrollView(){
                BooksCarousel(carouselTitle: "Nowe", carouselData: getNewBookData(), carouselType: ProductType.book, carouselListType: ProductListType.new)
                BooksCarousel(carouselTitle: "Bestsellery", carouselData: getBestBookData(), carouselType: ProductType.book, carouselListType: ProductListType.best)
                BooksCarousel(carouselTitle: "Polecane", carouselData: getRecommendedBookwData(), carouselType: ProductType.book, carouselListType: ProductListType.recommended)
            }.navigationBarTitle("Książki")
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
    
    func getNewBookData() -> [Book] {
        return Array(bookData[0...4])
    }
    func getBestBookData() -> [Book] {
        return Array(bookData[5...9])
    }
    func getRecommendedBookwData() -> [Book] {
        return Array(bookData[10...14])
    }
}

struct BooksTab_Previews: PreviewProvider {
    static var previews: some View {
        BooksTab()
    }
}
