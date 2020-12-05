//
//  BookDetails.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import SwiftUI

struct BookDetails: View {
    var bookItem: Book
    @State var showSheetView = false
    @State private var showingAlert = false
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        ScrollView {
            bookItem.mainImage
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 400)
                .padding()
                .modifier(ParallaxMotionModifier(magnitude: 10))

            HStack() {
                VStack(alignment: .leading){
                    Text(bookItem.title)
                        .font(.title)
                    Text(bookItem.author)
                        .font(.title2)
                }
                Spacer()
                HStack(){
                    Button(action: {
                        addItemToCart(itemToAdd: bookItem)
                    }) {
                        Text(String(format: "%.2f zł", bookItem.price))
                            .font(.headline)
                        Image(systemName: "cart.badge.plus").imageScale(.large)
                    }
                }
            }.padding(.horizontal)
            VStack(alignment: .leading){
                if bookItem.description != "" {
                    DescriptionView(descriptionText: bookItem.description)
                }
                DetailsTable(item: bookItem)
            }.padding([.leading, .bottom, .trailing])
        }.navigationBarTitle(bookItem.title, displayMode: .inline)
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
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Ten przedmiot znajduje się już w twoim koszyku!"))
        }
        
    }
    
    func addItemToCart (itemToAdd: Book) {
        if self.cart.items.contains(where: {item in item.id == itemToAdd.id }) {
            self.showingAlert = true
        } else {
            let item = CartItem()
            item.id = bookItem.id
            item.title = bookItem.title
            item.extraText = bookItem.author
            item.price = bookItem.price
            item.mainImageName = bookItem.mainImageName
            item.amount = 1
            self.cart.items.append(item)
        }
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(bookItem: bookData[0])
    }
}
