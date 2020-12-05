//
//  SearchTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct SearchTab: View {
    @State var showSheetView = false
    @EnvironmentObject var cartItems: CartItems
    
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("szukaj produktów...", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                }
                .padding(.horizontal)
                
                List {
                    ForEach(getAllProducts().filter{$0.title.hasPrefix(searchText) || searchText == ""}, id: \.id) {
                        product in if product is Music {
                            MusicListRow(musicItem: product as! Music)
                        } else {
                            MoviesListRow(movieItem: product as! Movie)
                        }
                    }
                }
                .navigationBarTitle(Text("Szukaj"))
                .navigationBarItems(trailing:
                                        Button(action: {
                                            self.showSheetView.toggle()
                                        }){
                                            if cartItems.items.isEmpty{
                                                Text("Koszyk")
                                                Image(systemName: "cart").imageScale(.large)
                                            } else {
                                                Text("Koszyk (\(cartItems.items.count))" )
                                                Image(systemName: "cart.fill").imageScale(.large)
                                            }
                                        }
                )
                .resignKeyboardOnDragGesture()
            }
        }.sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
    }
    
    func getAllProducts() -> [Product] {
        return Array(musicData as [Product] + movieData as [Product]).shuffled()
    }
}

struct SearchTab_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            SearchTab()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}


struct ResignKeyboardOnDragGesture: ViewModifier {
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
    
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
