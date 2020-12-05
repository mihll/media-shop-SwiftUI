//
//  CartConfirmItemRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 03/12/2020.
//

import SwiftUI

struct CartConfirmItemRow: View {
    @ObservedObject var cartItem : CartItem
    
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
                    Text("\(cartItem.amount) szt.")
                        .frame(minWidth: 45)
                }
                .padding(.top, 1.0)
            }
            .padding(.leading)
        }
    }
}

struct CartConfirmItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            CartConfirmItemRow(cartItem: CartItem())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
