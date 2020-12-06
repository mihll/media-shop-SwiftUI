//
//  OrderDetails.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 06/12/2020.
//

import SwiftUI

struct OrderDetails: View {
    @State var orderItem: Cart
    @State var showSheetView = false
    @EnvironmentObject var cart: Cart

    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter
    }()
    
    var body: some View {
        Form(){
            Section(header: Text("SZCZEGÓŁY ZAMÓWIENIA")) {
                HStack {
                    Text("Numer zamówienia")
                    Spacer()
                    Text(String(orderItem.id))
                }
                HStack {
                    Text("Data zamówienia")
                    Spacer()
                    Text("\(orderItem.orderDate, formatter: Self.dateFormat)")
                }
                HStack {
                    Text("Status zamówienia")
                    Spacer()
                    Text("ZŁOŻONE")
                        .bold()
                }
            }
            
            Section(header: Text("ZAWARTOŚĆ KOSZYKA")) {
                ForEach(orderItem.items) { cartItem in
                    CartConfirmItemRow(cartItem: cartItem)
                }
                HStack {
                    Text("Koszt dostawy")
                    Spacer()
                    Text(String(format: "%.2f zł",orderItem.deliveryPrices[orderItem.deliveryIndex]))
                }
                HStack {
                    Text("Razem")
                        .fontWeight(.bold)
                    Spacer()
                    Text(String(format: "%.2f zł",orderItem.getTotal()))
                        .fontWeight(.bold)
                }
            }
            
            Section(header: Text("DOSTAWA")) {
                HStack {
                    Text("Metoda dostawy")
                    Spacer()
                    Text(orderItem.deliveryOptions[orderItem.deliveryIndex])
                }
                HStack {
                    Text("Imię i nazwisko/Nazwa firmy")
                    Spacer()
                    Text(orderItem.deliveryName)
                }
                HStack {
                    Text("Adres")
                    Spacer()
                    Text(orderItem.deliveryAddress)
                }
                HStack {
                    Text("Kod pocztowy")
                    Spacer()
                    Text(orderItem.deliveryPostcode)
                }
                HStack {
                    Text("Miasto")
                    Spacer()
                    Text(orderItem.deliveryCity)
                }
            }
            
            Section(header: Text("RACHUNEK/FAKTURA")) {
                Toggle(isOn: $orderItem.billingSameAddress) {
                    Text("Dane jak do wysyłki")
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Toggle(isOn: $orderItem.billingInvoice) {
                    Text("Faktura")
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                if(orderItem.billingInvoice) {
                    HStack {
                        Text("NIP")
                        Spacer()
                        Text(orderItem.billingNIP)
                    }
                }
                if(!orderItem.billingSameAddress){
                    HStack {
                        Text("Imię i nazwisko/Nazwa firmy")
                        Spacer()
                        Text(orderItem.billingName)
                    }
                    HStack {
                        Text("Adres")
                        Spacer()
                        Text(orderItem.billingAddress)
                    }
                    HStack {
                        Text("Kod pocztowy")
                        Spacer()
                        Text(orderItem.billingPostcode)
                    }
                    HStack {
                        Text("Miasto")
                        Spacer()
                        Text(orderItem.billingCity)
                    }
                }
            }
        }.navigationBarTitle("Zamówienie #" + String(orderItem.id), displayMode: .inline)
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

struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(orderItem: Cart())
    }
}
