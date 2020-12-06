//
//  OrdersListRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 06/12/2020.
//

import SwiftUI

struct OrdersListRow: View {
    var orderItem: Cart
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: OrderDetails(orderItem: orderItem)){
            HStack() {
                VStack(alignment: .leading){
                    Text("Zamówienie #" + String(orderItem.id))
                        .font(.headline)
                    Text("\(orderItem.orderDate, formatter: Self.dateFormat)")
                        .font(.subheadline)
                }
                Spacer()
                VStack(){
                    Text(String(format: "%.2f zł", orderItem.getTotal()))
                }
                .padding(.leading)
            }
        }
    }
}

struct OrdersListRow_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListRow(orderItem: Cart())
    }
}
