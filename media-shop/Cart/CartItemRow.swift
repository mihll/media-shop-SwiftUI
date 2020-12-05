//
//  CartItemRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 03/11/2020.
//

import SwiftUI

struct CartItemRow: View {
    @ObservedObject var cartItem : CartItem
    @EnvironmentObject var cart: Cart
    @State private var showingAlert = false
    
    var body: some View {
        HStack() {
            cartItem.mainImage
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .scaledToFit()
                .frame(width: 75, height: 100)
                .padding(.vertical)
            VStack(alignment: .leading){
                Text(cartItem.title)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
                Text(cartItem.extraText)
                    .font(.subheadline)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
            VStack(){
                Text(String(format: "%.2f zł", cartItem.price * Double(cartItem.amount)))
                HStack(){
                    Button(action: {
                        if cartItem.amount - 1 <= 0 {
                            self.showingAlert = true
                        } else {
                            cartItem.amount -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                    }.buttonStyle(PlainButtonStyle())
                    Text("\(cartItem.amount) szt.")
                        .frame(minWidth: 45)
                    Button(action: {
                        cartItem.amount += 1
                    }) {
                        Image(systemName: "plus.circle")
                    }.buttonStyle(PlainButtonStyle()) 
                }
                .padding(.top, 1.0)
            }
            .padding(.leading)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Czy na pewno chcesz usunąć ten przedmiot z koszyka?"),
                  primaryButton: .destructive(Text("Tak"), action: {
                    cart.items.remove(at: cart.items.firstIndex(where: {item in item.id == cartItem.id })!)
                  }),
                  secondaryButton: .cancel(Text("Nie")))
        }
    }
}

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            CartItemRow(cartItem: CartItem())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
