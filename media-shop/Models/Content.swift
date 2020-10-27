//
//  Content.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 27/10/2020.
//

import SwiftUI

protocol Content {
    var id: Int { get }
    var title: String { get }
    var price: String { get }
    var mainImageName: String { get }
}

extension Content {
    var mainImage: Image {
        ImageStore.shared.image(name: mainImageName)
    }
}

