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
