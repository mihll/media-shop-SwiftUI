//
//  CartItem.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 03/11/2020.
//

import SwiftUI
class CartItem: ObservableObject, Identifiable {
    var id = 0
    var title = "Testowy tytuł"
    var extraText = "Testowy wykonawca"
    var price = 10.00
    var mainImageName = ""
    @Published var amount = 0
}

extension CartItem {
    var mainImage: Image {
        ImageStore.shared.image(name: mainImageName)
    }
}

class CartItems: ObservableObject {
    @Published var items: [CartItem]

    init() {
        self.items = []
        let item = CartItem()
        item.id = musicData[0].id
        item.title = musicData[0].title
        item.extraText = musicData[0].artist
        item.price = musicData[0].price
        item.mainImageName = musicData[0].mainImageName
        item.amount = 1
        self.items.append(item)
    }
    
    func getTotal() -> Double {
        var total: Double = 0
        for item in self.items {
            total = total + (item.price * Double(item.amount))
        }
        return total
    }
}
