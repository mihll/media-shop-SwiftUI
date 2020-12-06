//
//  CartConfirmView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 03/12/2020.
//

import SwiftUI

struct CartConfirmView: View {
    @Binding var showSheetView: Bool
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var orderHistory: OrderHistory
    @State private var showingConfirm = false
    
    var body: some View {
        Form(){
            Section(header: Text("ZAWARTOŚĆ KOSZYKA")) {
                ForEach(cart.items) { cartItem in
                    CartConfirmItemRow(cartItem: cartItem)
                }
                HStack {
                    Text("Koszt dostawy")
                    Spacer()
                    Text(String(format: "%.2f zł",cart.deliveryPrices[cart.deliveryIndex]))
                }
                HStack {
                    Text("Razem")
                        .fontWeight(.bold)
                    Spacer()
                    Text(String(format: "%.2f zł",cart.getTotal()))
                        .fontWeight(.bold)
                }
            }
            
            Section(header: Text("DOSTAWA")) {
                HStack {
                    Text("Metoda dostawy")
                    Spacer()
                    Text(cart.deliveryOptions[cart.deliveryIndex])
                }
                HStack {
                    Text("Imię i nazwisko/Nazwa firmy")
                    Spacer()
                    Text(cart.deliveryName)
                }
                HStack {
                    Text("Adres")
                    Spacer()
                    Text(cart.deliveryAddress)
                }
                HStack {
                    Text("Kod pocztowy")
                    Spacer()
                    Text(cart.deliveryPostcode)
                }
                HStack {
                    Text("Miasto")
                    Spacer()
                    Text(cart.deliveryCity)
                }
            }
            
            Section(header: Text("RACHUNEK/FAKTURA")) {
                Toggle(isOn: $cart.billingSameAddress) {
                    Text("Dane jak do wysyłki")
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Toggle(isOn: $cart.billingInvoice) {
                    Text("Faktura")
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                if(cart.billingInvoice) {
                    HStack {
                        Text("NIP")
                        Spacer()
                        Text(cart.billingNIP)
                    }
                }
                if(!cart.billingSameAddress){
                    HStack {
                        Text("Imię i nazwisko/Nazwa firmy")
                        Spacer()
                        Text(cart.billingName)
                    }
                    HStack {
                        Text("Adres")
                        Spacer()
                        Text(cart.billingAddress)
                    }
                    HStack {
                        Text("Kod pocztowy")
                        Spacer()
                        Text(cart.billingPostcode)
                    }
                    HStack {
                        Text("Miasto")
                        Spacer()
                        Text(cart.billingCity)
                    }
                }
            }
            
            Section {
                Button(action: {
                    showingConfirm = true;
                }) {
                    HStack() {
                        Spacer()
                        Text("Złóż zamówienie")
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
        }
        .alert(isPresented: $showingConfirm) {
            Alert(title: Text("Twoje zamówienie zostało złożone!"),
                  dismissButton: .default(Text("OK"), action: {
                    orderHistory.addOrderToHistory(order: cart);
                    cart.submitOrder();
                    showingConfirm = false;
                    showSheetView = false;
                  }))
        }
        .navigationBarTitle("Podsumowanie", displayMode: .inline)
    }
}

struct CartConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            CartConfirmView(showSheetView: .constant(true))
                .environmentObject(Cart())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
