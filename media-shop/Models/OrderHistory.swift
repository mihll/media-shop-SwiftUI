//
//  OrderHistory.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import Foundation

class OrderHistory: ObservableObject {
    @Published var orders: [Cart] = []
}
