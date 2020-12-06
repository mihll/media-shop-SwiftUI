//
//  ProfileTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct OrdersTab: View {
    @State var showSheetView = false
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var orderHistory: OrderHistory

    var body: some View {
        NavigationView(){
            if orderHistory.orders.isEmpty {
                VStack(alignment: .center){
                    Image(systemName: "bag")
                        .font(.system(size: 150))
                        .foregroundColor(Color(UIColor.secondarySystemFill))
                    Text("Twoja historia zamówień jest pusta.")
                        .foregroundColor(Color.gray)
                        .padding(.top)
                }.navigationBarTitle("Zamówienia")
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
            } else {
                List(orderHistory.orders) { order in
                    OrdersListRow(orderItem: order)
                }.navigationBarTitle("Zamówienia")
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
            }
        }.sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
    }
}

struct OrdersTab_Previews: PreviewProvider {
    static var previews: some View {
        OrdersTab()
    }
}
