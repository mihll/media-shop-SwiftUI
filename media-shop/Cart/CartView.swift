//
//  CartView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct CartView: View {
    @Binding var showSheetView: Bool
    @EnvironmentObject var cartItems: CartItems
    
    @State var deliveryName: String = ""
    @State var deliveryAddress: String = ""
    @State var deliveryPostcode: String = ""
    @State var deliveryCity: String = ""
    @State var deliveryIndex = 0
    @State var billingSameAddress = true
    @State var billingName: String = ""
    @State var billingAddress: String = ""
    @State var billingPostcode: String = ""
    @State var billingCity: String = ""
    @State var billingInvoice = false
    @State var billingNIP: String = ""
    var deliveryOptions = ["Poczta Polska (15.00 zł)", "Kurier DPD (20.00 zł)", "Kurier UPS (25.00 zł)"]
    var deliveryPrices = [15.00, 20.00, 25.00]
    
    var body: some View {
        NavigationView {
            if cartItems.items.isEmpty {
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
                        ForEach(cartItems.items) { cartItem in
                            CartItemRow(cartItem: cartItem)
                        }
                        .onDelete(perform: { indexSet in
                            cartItems.items.remove(atOffsets: indexSet)
                        })
                    }
                    Section(header: Text("DOSTAWA")) {
                        Picker(selection: $deliveryIndex, label: Text("Metoda dostawy")) {
                            ForEach(0 ..< deliveryOptions.count) {
                                Text(self.deliveryOptions[$0])
                            }
                        }
                        TextField("Imię i nazwisko/Nazwa firmy", text: $deliveryName)
                        TextField("Adres", text: $deliveryAddress)
                        TextField("Kod pocztowy", text: $deliveryPostcode)
                        TextField("Miasto", text: $deliveryCity)
                    }
                    
                    Section(header: Text("RACHUNEK/FAKUTRA")) {
                        Toggle(isOn: $billingSameAddress) {
                            Text("Dane jak do wysyłki")
                        }
                        Toggle(isOn: $billingInvoice) {
                            Text("Faktura")
                        }
                        if (billingInvoice) {
                            TextField("NIP", text: $billingNIP)
                        }
                        if (!billingSameAddress) {
                            TextField("Imię i nazwisko/Nazwa firmy", text: $billingName)
                            TextField("Adres", text: $billingAddress)
                            TextField("Kod pocztowy", text: $billingPostcode)
                            TextField("Miasto", text: $billingCity)
                        }
                    }
                    
                    Section {
                            NavigationLink(
                                destination: CartConfirmView(showSheetView: $showSheetView, deliveryName: deliveryName, deliveryAddress: deliveryAddress, deliveryPostcode: deliveryPostcode, deliveryCity: deliveryCity, deliveryIndex: deliveryIndex, billingSameAddress: billingSameAddress, billingName: billingName, billingAddress: billingAddress, billingPostcode: billingPostcode, billingCity: billingCity, billingInvoice: billingInvoice, billingNIP: billingNIP),
                                label: {
                                    Text("Podsumowanie")
                                })
                    }
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
                .environmentObject(CartItems())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
