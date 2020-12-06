//
//  Cart.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import Foundation
import SwiftUI

class Cart: ObservableObject, Identifiable {
    var id: Int = 1;
    var orderDate: Date = Date()
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
    
    init() {
        
    }
    
    init(copyFrom: Cart) {
        self.id = copyFrom.id;
        self.orderDate = Date();
        self.items = copyFrom.items
        self.deliveryName = copyFrom.deliveryName
        self.deliveryAddress = copyFrom.deliveryAddress
        self.deliveryPostcode = copyFrom.deliveryPostcode
        self.deliveryCity = copyFrom.deliveryCity
        self.deliveryIndex = copyFrom.deliveryIndex
        self.deliveryOptions = copyFrom.deliveryOptions
        self.deliveryPrices = copyFrom.deliveryPrices
        self.billingSameAddress = copyFrom.billingSameAddress
        self.billingName = copyFrom.billingName
        self.billingAddress = copyFrom.billingAddress
        self.billingPostcode = copyFrom.billingPostcode
        self.billingCity = copyFrom.billingCity
        self.billingInvoice = copyFrom.billingInvoice
        self.billingNIP = copyFrom.billingNIP
    }
    
    func getTotal() -> Double {
        var total: Double = 0
        for item in self.items {
            total = total + (item.price * Double(item.amount))
        }
        total = total + deliveryPrices[deliveryIndex]
        return total
    }
    
    func submitOrder() {
        id = id + 1;
        items.removeAll()
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
