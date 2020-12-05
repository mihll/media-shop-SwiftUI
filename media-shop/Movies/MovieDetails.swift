//
//  MovieDetails.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 18/11/2020.
//

import SwiftUI

struct MovieDetails: View {
    var movieItem: Movie
    @State var showSheetView = false
    @State private var showingAlert = false
    @EnvironmentObject var cartItems: CartItems
    var body: some View {
        ScrollView {
            movieItem.mainImage
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 400)
                .padding()
            HStack() {
                VStack(alignment: .leading){
                    Text(movieItem.title)
                        .font(.title)
                    Text(movieItem.director)
                        .font(.title2)
                }
                Spacer()
                HStack(){
                    Button(action: {
                        addItemToCart(itemToAdd: movieItem)
                    }) {
                        Text(String(format: "%.2f zł", movieItem.price))
                            .font(.headline)
                        Image(systemName: "cart.badge.plus").imageScale(.large)
                    }
                }
            }.padding(.horizontal)
            VStack(alignment: .leading){
                if movieItem.description != "" {
                    DescriptionView(descriptionText: movieItem.description)
                }
                if movieItem.trailerFileName != "" {
                    TrailerView(trailerFileName: movieItem.trailerFileName)
                }
                DetailsTable(item: movieItem)
            }.padding([.leading, .bottom, .trailing])
        }.navigationBarTitle(movieItem.title, displayMode: .inline)
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
        .sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Ten przedmiot znajduje się już w twoim koszyku!"))
        }
        
    }
    
    func addItemToCart (itemToAdd: Movie) {
        if self.cartItems.items.contains(where: {item in item.id == itemToAdd.id }) {
            self.showingAlert = true
        } else {
            let item = CartItem()
            item.id = movieItem.id
            item.title = movieItem.title
            item.extraText = movieItem.director
            item.price = movieItem.price
            item.mainImageName = movieItem.mainImageName
            item.amount = 1
            self.cartItems.items.append(item)
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movieItem: movieData[0])
    }
}
