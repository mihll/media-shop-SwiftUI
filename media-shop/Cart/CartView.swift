//
//  CartView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct CartView: View {
    @Binding var showSheetView: Bool
    @EnvironmentObject var cart: Cart
    
    var shippingValid: Bool {
        cart.deliveryName != "" && cart.deliveryAddress != "" && cart.deliveryPostcode != "" && cart.deliveryCity != ""
    }
    
    var billingValid: Bool {
        if(!cart.billingSameAddress){
            return cart.billingName != "" && cart.billingAddress != "" && cart.billingPostcode != "" && cart.billingCity != ""
        } else {
            return true
        }
    }
    
    var invoiceValid: Bool {
        if(cart.billingInvoice){
            return cart.billingNIP != ""
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
            if cart.items.isEmpty {
                VStack(alignment: .center){
                    Image(systemName: "cart")
                        .font(.system(size: 150))
                        .foregroundColor(Color(UIColor.secondarySystemFill))
                    Text("Twój koszyk jest pusty.")
                        .foregroundColor(Color.gray)
                        .padding(.top)
                }.navigationBarTitle("Koszyk", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Gotowe").bold()
                })
            } else {
                Form(){
                    Section(header: Text("ZAWARTOŚĆ KOSZYKA")) {
                        ForEach(cart.items) { cartItem in
                            CartItemRow(cartItem: cartItem)
                        }
                        .onDelete(perform: { indexSet in
                            cart.items.remove(atOffsets: indexSet)
                        })
                    }
                    Section(header: Text("DOSTAWA")) {
                        Picker(selection: $cart.deliveryIndex, label: Text("Metoda dostawy")) {
                            ForEach(0 ..< cart.deliveryOptions.count) {
                                Text(cart.deliveryOptions[$0])
                            }
                        }
                        TextField("Imię i nazwisko/Nazwa firmy", text: $cart.deliveryName)
                            .modifier(TextFieldClearButton(text: $cart.deliveryName))
                        TextField("Adres", text: $cart.deliveryAddress)
                            .modifier(TextFieldClearButton(text: $cart.deliveryAddress))
                        TextField("Kod pocztowy", text: $cart.deliveryPostcode)
                            .modifier(TextFieldClearButton(text: $cart.deliveryPostcode))
                        TextField("Miasto", text: $cart.deliveryCity)
                            .modifier(TextFieldClearButton(text: $cart.deliveryCity))
                    }
                    
                    Section(header: Text("RACHUNEK/FAKUTRA")) {
                        Toggle(isOn: $cart.billingSameAddress) {
                            Text("Dane jak do wysyłki")
                        }
                        Toggle(isOn: $cart.billingInvoice) {
                            Text("Faktura")
                        }
                        if (cart.billingInvoice) {
                            TextField("NIP", text: $cart.billingNIP)
                                .modifier(TextFieldClearButton(text: $cart.billingNIP))
                        }
                        if (!cart.billingSameAddress) {
                            TextField("Imię i nazwisko/Nazwa firmy", text: $cart.billingName)
                                .modifier(TextFieldClearButton(text: $cart.billingName))
                            TextField("Adres", text: $cart.billingAddress)
                                .modifier(TextFieldClearButton(text: $cart.billingAddress))
                            TextField("Kod pocztowy", text: $cart.billingPostcode)
                                .modifier(TextFieldClearButton(text: $cart.billingPostcode))
                            TextField("Miasto", text: $cart.billingCity)
                                .modifier(TextFieldClearButton(text: $cart.billingCity))
                        }
                    }
                    
                    Section {
                        NavigationLink(
                            destination: CartConfirmView(showSheetView: $showSheetView),
                            label: {
                                Text("Podsumowanie")
                                    .fontWeight(.bold)
                            })
                    }.disabled(!(shippingValid && billingValid && invoiceValid))
                }
                .navigationBarTitle("Koszyk", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Gotowe").bold()
                })
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            CartView(showSheetView: .constant(true))
                .environmentObject(Cart())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
