//
//  ProductTile.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 27/10/2020.
//

import SwiftUI

struct ProductTile: View {
    var extraInfo: String
    var product: Product
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: getDestination(from: product)) {
                product.mainImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaledToFit()
                    .frame(maxHeight: 200)
            }
            
            HStack() {
                VStack(alignment: .leading){
                    Text(product.title)
                        .font(.headline)
                        .lineLimit(1)
                    Text(extraInfo)
                        .font(.subheadline)
                        .lineLimit(1)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text(String(format: "%.2f zł", product.price))
                }
            }
        }
        .padding([.leading, .bottom])
    }
    
    func getDestination(from navItem: Product) -> AnyView {
        if navItem is Music {
            return AnyView(MusicDetails(musicItem: navItem as! Music))
        } else if navItem is Movie {
            return AnyView(MovieDetails(movieItem: navItem as! Movie))
        } else {
            return AnyView(MovieDetails(movieItem: navItem as! Movie))
        }
    }
}

struct ProductTile_Previews: PreviewProvider {
    static var previews: some View {
        ProductTile(extraInfo: musicData[0].artist, product: musicData[0])
    }
}
