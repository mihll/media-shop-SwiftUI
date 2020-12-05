//
//  Cart.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import Foundation
import SwiftUI

class Cart: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var deliveryName: String = ""
    @Published var deliveryAddress: String = ""
    @Published var deliveryPostcode: String = ""
    @Published var deliveryCity: String = ""
    @Published var deliveryIndex = 0
    @Published var deliveryOptions = ["Poczta Polska (15.00 zł)", "Kurier DPD (20.00 zł)", "Kurier UPS (25.00 zł)"]
    @Published var deliveryPrices = [15.00, 20.00, 25.00]
    @Published var billingSameAddress = true
    @Published var billingName: String = ""
    @Published var billingAddress: String = ""
    @Published var billingPostcode: String = ""
    @Published var billingCity: String = ""
    @Published var billingInvoice = false
    @Published var billingNIP: String = ""
    
    func getTotal() -> Double {
        var total: Double = 0
        for item in self.items {
            total = total + (item.price * Double(item.amount))
        }
        return total
    }
    
    func submitOrder() {
        items.removeAll();
        deliveryName = ""
        deliveryAddress = ""
        deliveryPostcode = ""
        deliveryCity = ""
        deliveryIndex = 0
        billingSameAddress = true
        billingName = ""
        billingAddress = ""
        billingPostcode = ""
        billingCity = ""
        billingInvoice = false
        billingNIP = ""
    }
}
