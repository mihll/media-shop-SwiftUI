//
//  Product.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 27/10/2020.
//

import SwiftUI

protocol Product {
    var id: Int { get }
    var title: String { get }
    var price: Double { get }
    var mainImageName: String { get }
}

extension Product {
    var mainImage: Image {
        ImageStore.shared.image(name: mainImageName)
    }
}

enum ProductType {
    case music
    case movie
    case book
}
